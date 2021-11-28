import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/pages/cart_page.dart';
import 'package:safora_mart/static_variavles/text_theme.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/product_list.dart';

class WishListPage extends StatelessWidget {
  WishListPage({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();
  final CartController _cartController = Get.find();

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
          actions: [
            Center(
              child: InkWell(
                child: Stack(children: [
                  Icon(
                    LineAwesomeIcons.shopping_cart_arrow_down,
                    color: Colors.grey.shade800,
                    size: _publicController.size.value * .085,
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.all(_publicController.size.value * .007),
                      decoration: const BoxDecoration(
                          color: ThemeAndColor.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: GetBuilder<CartController>(
                        init: CartController(),
                        builder: (_) {
                          return Text(
                            _cartController.itemCount.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: _publicController.size.value * .02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          );
                        },
                      ),
                    ),
                  )
                ]),
                onTap: () => Get.to(() => const CartPage()),
              ),
            ),
            const SizedBox(width: 8.0),
            Center(
              child: InkWell(
                child: Stack(children: [
                  Icon(
                    LineAwesomeIcons.bell,
                    color: Colors.grey.shade800,
                    size: _publicController.size.value * .085,
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.all(_publicController.size.value * .007),
                      decoration: const BoxDecoration(
                          color: ThemeAndColor.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        '9+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: _publicController.size.value * .02,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  )
                ]),
                onTap: () {},
              ),
            )
          ],
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
