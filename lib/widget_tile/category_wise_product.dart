import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/widget_tile/product_grid.dart';

class CategoryWiseProduct extends StatelessWidget {
  CategoryWiseProduct({Key? key}) : super(key: key);

  final ProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: _productController.items.length,
      itemBuilder: (context, index) {
        return GetBuilder(
            init: ProductController(),
            builder: (value) => ProductGrid(
                  img: _productController.items[index].imageUrl,
                  title: _productController.items[index].productTitle,
                  price: _productController.items[index].price,
                  discount: _productController.items[index].discount,
                )
            // Card(
            //   child: Expanded(
            //     child: Container(
            //       width: 150,
            //       height: 200,
            //       child: Text(
            //         _productController.items[index].productTitle,
            //         maxLines: 1,
            //       ),
            //     ),
            //   ),
            // ),
            );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //       scrollDirection: Axis.horizontal,
  //       shrinkWrap: true,
  //       children: [
  //         ProductGrid(
  //           img: _productController.items[0].imageUrl,
  //           title: _productController.items[0].productTitle,
  //           price: _productController.items[0].price,
  //           discount: _productController.items[0].discount,
  //         ),
  //         ProductGrid(
  //           img: _productController.items[1].imageUrl,
  //           title: _productController.items[1].productTitle,
  //           price: _productController.items[1].price,
  //           discount: _productController.items[1].discount,
  //         ),
  //         ProductGrid(
  //           img: _productController.items[2].imageUrl,
  //           title: _productController.items[2].productTitle,
  //           price: _productController.items[2].price,
  //           discount: _productController.items[2].discount,
  //         ),
  //       ]);
  // }
}
