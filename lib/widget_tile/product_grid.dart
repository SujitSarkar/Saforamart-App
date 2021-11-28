import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/pages/product_details_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

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

  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = _productController.findProductById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(_product.imageUrl),
                                  fit: BoxFit.contain)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 10,
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
                                top: -5,
                                right: -8,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: IconButton(
                                      icon: Icon(
                                        _product.isFavourite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
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
                                    )),
                              ),
                            ],
                          ),
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
      ),
    );
  }
}
