import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/pages/product_details_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/product_amount_btns.dart';
import 'package:safora_mart/widget_tile/product_amount_inc.dart';

import '../config.dart';

class ProductGrid extends StatefulWidget {
  final int id;

  const ProductGrid({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();
  final CartController cartController = Get.find();

  late Product _product;

  Color animateBGColor = ThemeAndColor.themeColor;
  Color animateFGColor = ThemeAndColor.whiteColor;
  bool isAnimate = false;

  double animateWith = customWidth(0.08);
  double animatePositionRight = customWidth(0.02);

  animationOpne() {
    setState(() {
      isAnimate = true;
      animateWith = customWidth(.29);
      animatePositionRight = customWidth(.02);
    });
  }

  animationClose() {
    setState(() {
      isAnimate = false;
      animateWith = customWidth(0.08);
      animatePositionRight = customWidth(0.02);
    });
  }

  @override
  void initState() {
    super.initState();
    _product = _productController.findProductById(widget.id);
  }

  var isProductAddedToCart = false.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: customWidth(0.4),
      height: customWidth(0.35),
      child: GestureDetector(
          onTap: () {
            Get.to(() => ProductDetailPage(id: widget.id));
          },
          child: GetBuilder<ProductController>(
            init: ProductController(),
            initState: (_) {},
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                      width: customWidth(0.4),
                      height: customWidth(0.35),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/dove-lotion.jpg"),
                              fit: BoxFit.contain)),
                      child: Stack(
                        children: [
                          Visibility(
                            visible: isAnimate,
                            child: Positioned(
                              bottom: customWidth(.06),
                              right: customWidth(-.02),
                              child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  icon: Icon(
                                    FontAwesomeIcons.solidWindowClose,
                                    color: animateBGColor,
                                    size: customWidth(0.065),
                                  ),
                                  onPressed: () {
                                    animationClose();
                                  }),
                            ),
                          ),
                          Positioned(
                            bottom: customWidth(.01),
                            right: animatePositionRight,
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                              width: animateWith,
                              height: customWidth(0.08),
                              decoration: BoxDecoration(
                                  color: animateBGColor,
                                  borderRadius: BorderRadius.circular(
                                      customWidth(0.063))),
                              child: isAnimate
                                  ? Row(
                                      children: [
                                        ProductAmountBtns(
                                          productId: widget.id,
                                        ),
                                      ],
                                    )
                                  : IconButton(
                                      padding: const EdgeInsets.all(0),
                                      alignment: Alignment.center,
                                      icon: Icon(
                                        LineAwesomeIcons
                                            .shopping_cart_arrow_down,
                                        color: animateFGColor,
                                        size: customWidth(0.055),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isAnimate = true;
                                        });
                                        animationOpne();
                                        isProductAddedToCart.toggle();
                                        cartController.addItem(
                                          _productController
                                              .items[widget.id].id,
                                          _productController
                                              .items[widget.id].price,
                                          _productController
                                              .items[widget.id].productTitle,
                                          1,
                                          _productController
                                              .items[widget.id].imageUrl,
                                        );
                                        print("Product added to Cart...");
                                      }),
                            ),
                          ),
                          Positioned(
                            top: customWidth(0.036),
                            left: customWidth(0.036),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(.7),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                _product.discount.toStringAsFixed(2),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: ThemeAndColor.whiteColor,
                                    ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: customWidth(-.01),
                            right: customWidth(-0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: IconButton(
                                icon: _product.isFavourite
                                    ? Icon(
                                        FontAwesomeIcons.solidHeart,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: _publicController.size.value *
                                            0.055,
                                      )
                                    : Icon(
                                        FontAwesomeIcons.heart,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: _publicController.size.value *
                                            0.055,
                                      ),
                                onPressed: () {
                                  _productController
                                      .toggleFavouriteStatus(widget.id);
                                  Fluttertoast.showToast(
                                      msg: _product.isFavourite
                                          ? "Added to Wishlist"
                                          : "Remove from Wishlist",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      _product.productTitle,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\u{09F3}${_product.price.toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _product.discountPrice == 0
                              ? ""
                              : "\u{09F3}${_product.discountPrice!.toStringAsFixed(2)}",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
