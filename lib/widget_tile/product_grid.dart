import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  final CartController _cartController = Get.find();

  late Product _product;

  Color animateBGColor = ThemeAndColor.themeColor;
  Color animateFGColor = ThemeAndColor.whiteColor;
  bool isAnimate = false;
  bool isDelayedAnimate = false;

  double animateWith = customWidth(0.08);

  animationOpne() {
    setState(() {
      isAnimate = true;
      animateWith = customWidth(.29);
    });
  }

  animationClose() {
    setState(() {
      isAnimate = false;
      animateWith = customWidth(0.08);
    });
  }

  @override
  void initState() {
    super.initState();
    _product = _productController.findProductById(widget.id);
    isProductAddedToCart.value = _product.isFavourite!;
    // discountPrice =
    //     _product.price - ((_product.price / 100) * _product.discount);
  }

  var isProductAddedToCart = false.obs;
  void delayeAnimate() {
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => setState(() => isDelayedAnimate = !isDelayedAnimate));
    print("Delayed................$isDelayedAnimate");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: customWidth(0.45),
      height: customWidth(0.55),
      child: GetBuilder<ProductController>(
        init: ProductController(),
        initState: (_) {
          _product = _productController.findProductById(widget.id);
          isProductAddedToCart.value = _product.isFavourite!;
        },
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailPage(id: _product.id));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    width: customWidth(0.45),
                    height: customWidth(0.55),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_product.images[0]),
                            fit: BoxFit.contain)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          bottom: customWidth(.01),
                          right: customWidth(.1),
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            width: animateWith,
                            height: customWidth(0.08),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                customWidth(0.063),
                              ),
                              border: Border.all(
                                color: isAnimate
                                    ? ThemeAndColor.themeColor
                                    : Colors.transparent,
                              ),
                              color: Colors.white,
                            ),
                            child: isAnimate
                                ? Visibility(
                                    visible: isDelayedAnimate,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ProductAmountInc(
                                          productId: widget.id,
                                          gap: .025,
                                          isRounded: false,
                                          iconSize: customWidth(.05),
                                          textSize: customWidth(.04),
                                        ),
                                        InkWell(
                                          child: Icon(
                                            FontAwesomeIcons.times,
                                            color: animateBGColor,
                                            size: customWidth(0.05),
                                          ),
                                          onTap: () {
                                            animationClose();
                                            delayeAnimate();
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : Visibility(
                                    visible: !isAnimate,
                                    child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        icon: Icon(
                                          isProductAddedToCart.isFalse
                                              ? LineAwesomeIcons
                                                  .shopping_cart_arrow_down
                                              : FontAwesomeIcons.cartArrowDown,
                                          color: ThemeAndColor.themeColor,
                                          size: isProductAddedToCart.isFalse
                                              ? customWidth(0.055)
                                              : customWidth(0.05),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isAnimate = true;
                                          });
                                          delayeAnimate();
                                          animationOpne();
                                          isProductAddedToCart.toggle();
                                          _cartController.addItem(
                                            _product.id,
                                            _product.price,
                                            _product.title,
                                            1,
                                            _product.images[0],
                                          );
                                          print("Product added to Cart...");
                                        }),
                                  ),
                          ),
                        ),
                        //discount percent
                        Visibility(
                          visible: !(_product.discount == 0.0),
                          child: Positioned(
                            top: customWidth(-0.02),
                            left: customWidth(-0.02),
                            child: Container(
                              padding: EdgeInsets.all(customWidth(.01)),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(.5),
                                  borderRadius:
                                      BorderRadius.circular(customWidth(.02))),
                              child: Text(
                                "${_product.discount.toStringAsFixed(0)}\u{0025}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      color: ThemeAndColor.whiteColor,
                                      fontSize: customWidth(.03),
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        //Favourit button
                        Positioned(
                          bottom: customWidth(-.015),
                          right: customWidth(-0.02),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4)),
                            child: IconButton(
                              icon: _product.isFavourite!
                                  ? Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size:
                                          _publicController.size.value * 0.055,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.heart,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size:
                                          _publicController.size.value * 0.055,
                                    ),
                              onPressed: () {
                                _productController
                                    .toggleFavouriteStatus(widget.id);
                                Fluttertoast.showToast(
                                    msg: _product.isFavourite!
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
                SizedBox(
                  height: customWidth(.012),
                ),
                //Product title section....................
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: customWidth(.01)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: customWidth(.035),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: customWidth(.012),
                ),
                //Price section..............
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(
                      bottom: customWidth(.015), left: customWidth(.01)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //discount price

                      Text(
                        _product.discount == 0.0
                            ? ""
                            : "\u{09F3}${(_product.price - ((_product.price / 100) * _product.discount)).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: customWidth(.02),
                      ),
                      //orginal price
                      Text(
                        "\u{09F3}${_product.price.toStringAsFixed(2)}",
                        style: _product.discount == 0.0
                            ? const TextStyle(
                                fontWeight: FontWeight.w600,
                              )
                            : const TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RatingBarIndicator(
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: ThemeAndColor.themeColor,
                    ),
                    rating: _product.rating,
                    itemCount: 5,
                    itemSize: customWidth(.04),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
