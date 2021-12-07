import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/pages/product_details_page.dart';
import 'package:safora_mart/pages/single_category_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/product_grid.dart';

class CategoryWiseProduct extends StatefulWidget {
  final String categoryTitle;
  const CategoryWiseProduct({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  State<CategoryWiseProduct> createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  final ProductController _productController = Get.find();

  final PublicController _publicController = Get.find();

  var productIndex = 0;

  pressCallBack(int id) {
    Get.to(() => ProductDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _publicController.size.value,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Text(
                widget.categoryTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() =>
                        SingleCategoryPage(pageTitle: widget.categoryTitle));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "More Product",
                        style: TextStyle(
                            fontSize: _publicController.size.value * 0.04),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: _publicController.size.value * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: _publicController.size.value * .6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _productController.items.length,
              itemBuilder: (context, index) {
                return GetBuilder(
                    init: ProductController(),
                    builder: (value) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: customWidth(.012)),
                        child: ProductGrid(
                          id: _productController.items[index].id,
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  // getProduct(int index) {
  //   _productController.currentProductIndex = index;
  //   _productGrid(
  //     id: _productController.items[index].id,
  //     img: _productController.items[index].imageUrl,
  //     title: _productController.items[index].productTitle,
  //     price: _productController.items[index].price,
  //     discount: _productController.items[index].discount,
  //   );
  // }

  // Widget _productGrid({
  //   required final int id,
  //   required final String img,
  //   required final String title,
  //   required final double price,
  //   required final double discount,
  //   double? discountPrice = 0,
  // }) {
  //   return Card(
  //     child: SizedBox(
  //       width: 120,
  //       height: 150,
  //       child: GestureDetector(
  //           onTap: () {
  //             Get.to(() => ProductDetailPage(id: id));
  //           },
  //           child: GetBuilder<ProductController>(
  //             init: ProductController(),
  //             initState: (_) {},
  //             builder: (controller) {
  //               return Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Expanded(
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(top: 5),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                             image: DecorationImage(
  //                                 image: NetworkImage(img),
  //                                 fit: BoxFit.contain)),
  //                         child: Stack(
  //                           children: [
  //                             Positioned(
  //                               top: 10,
  //                               left: 10,
  //                               child: Container(
  //                                 padding: const EdgeInsets.all(3),
  //                                 decoration: BoxDecoration(
  //                                     color: Theme.of(context)
  //                                         .colorScheme
  //                                         .secondary
  //                                         .withOpacity(.7),
  //                                     borderRadius: BorderRadius.circular(4)),
  //                                 child: Text(
  //                                   discount.toStringAsFixed(2),
  //                                   style: Theme.of(context)
  //                                       .textTheme
  //                                       .headline4!
  //                                       .copyWith(
  //                                         color: ThemeAndColor.whiteColor,
  //                                       ),
  //                                 ),
  //                               ),
  //                             ),
  //                             Positioned(
  //                               top: -5,
  //                               right: -8,
  //                               child: Container(
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(4)),
  //                                   child: IconButton(
  //                                     icon: Icon(
  //                                       Icons.favorite_border,
  //                                       color: Theme.of(context)
  //                                           .colorScheme
  //                                           .secondary,
  //                                       size: _publicController.size.value *
  //                                           0.055,
  //                                     ),
  //                                     onPressed: () {
  //                                       _productController
  //                                           .toggleFavouriteStatus(id);
  //                                       Fluttertoast.showToast(
  //                                           msg: "Added to Wishlist",
  //                                           toastLength: Toast.LENGTH_SHORT,
  //                                           gravity: ToastGravity.CENTER,
  //                                           timeInSecForIosWeb: 1);
  //                                     },
  //                                   )),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 5),
  //                     child: Text(
  //                       title,
  //                       overflow: TextOverflow.fade,
  //                       maxLines: 1,
  //                       textAlign: TextAlign.center,
  //                       style: const TextStyle(fontSize: 10),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(bottom: 5.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           "\$${price.toStringAsFixed(2)}",
  //                           style: const TextStyle(fontWeight: FontWeight.w600),
  //                         ),
  //                         Text(
  //                           discountPrice == 0
  //                               ? ""
  //                               : "\$${price.toStringAsFixed(2)}",
  //                           style: const TextStyle(
  //                               decoration: TextDecoration.lineThrough),
  //                         )
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               );
  //             },
  //           )),
  //     ),
  //   );
  // }
}
