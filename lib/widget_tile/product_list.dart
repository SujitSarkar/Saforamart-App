import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/pages/product_details_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();

  late Product _product;
  double discountPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _product = _productController.findProductById(widget.id);
    discountPrice =
        _product.price - ((_product.price / 100) * _product.discount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: SizedBox(
          width: 120,
          height: 150,
          child: GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailPage(id: widget.id));
              },
              child: GetBuilder<ProductController>(
                init: ProductController(),
                initState: (_) {},
                builder: (controller) {
                  return SizedBox(
                    width: _publicController.size.value,
                    height: _publicController.size.value * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: _publicController.size.value * 0.3,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Image.asset(
                                _product.images[0],
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: _publicController.size.value * 0.62,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        _product.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              fontSize:
                                                  _publicController.size.value *
                                                      0.04,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Price: \u{09F3} ${_product.price.toStringAsFixed(2)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            fontSize:
                                                _publicController.size.value *
                                                    0.035,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Discount Price: "),
                                        Text(
                                          "\u{09F3} ${discountPrice.toStringAsFixed(2)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                fontSize: _publicController
                                                        .size.value *
                                                    0.035,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 80,
                                  right: 8,
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
                                  top: 30,
                                  right: 0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: IconButton(
                                        icon: Icon(
                                          _product.isFavourite!
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: _publicController.size.value *
                                              0.08,
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
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
