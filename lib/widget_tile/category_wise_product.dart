import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/pages/product_details_page.dart';
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

  pressCallBack() {
    Get.to(ProductDetailPage());
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "More Product",
                      style: TextStyle(fontSize: 10),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: _publicController.size.value * .45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _productController.items.length,
              itemBuilder: (context, index) {
                return GetBuilder(
                    init: ProductController(),
                    builder: (value) {
                      return productGrid(
                        img: _productController.items[index].imageUrl,
                        title: _productController.items[index].productTitle,
                        price: _productController.items[index].price,
                        discount: _productController.items[index].discount,
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  getProduct(int index) {
    _productController.currentProductIndex = index;
    productGrid(
      img: _productController.items[index].imageUrl,
      title: _productController.items[index].productTitle,
      price: _productController.items[index].price,
      discount: _productController.items[index].discount,
    );
  }

  Widget productGrid({
    required final String img,
    required final String title,
    required final double price,
    required final double discount,
    double? discountPrice = 0,
  }) {
    return Card(
      child: SizedBox(
        width: 120,
        height: 150,
        child: GestureDetector(
          onTap: pressCallBack,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(img), fit: BoxFit.contain)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            color: ThemeAndColor.secondaryColor.withOpacity(.8),
                            child: Text(
                              discount.toStringAsFixed(2),
                              style: TextStyle(color: ThemeAndColor.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title,
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
                      "\$${price.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      discountPrice == 0 ? "" : "\$${price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
