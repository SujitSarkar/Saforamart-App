import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/static_variavles/text_theme.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/product_list.dart';

class WishListPage extends StatelessWidget {
  WishListPage({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();

  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey),
          elevation: 1.0,
          title: Text(
            'Your WishList',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 18, color: Colors.black),
          ),
        ),
        drawer: const NavigationDrawer(),
        body: GetBuilder<ProductController>(
          init: ProductController(),
          initState: (_) {
            products = _productController.favouriteItems;
          },
          builder: (_) {
            return SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductList(
                    id: products[index].id,
                  );
                },
              ),
            );
          },
        ));
  }
}
