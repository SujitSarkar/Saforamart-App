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
            height: _publicController.size.value * .78,
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
}
