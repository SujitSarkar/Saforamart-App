import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/pages/product_details_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int productId;
  final String productImg;
  final double price;
  final int quantity;
  final String title;

  const CartItem({
    Key? key,
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
    required this.productImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartController.removeitem(productId);
      },
      child: GestureDetector(
        onTap: () => Get.off(ProductDetailPage(id: productId)),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: Container(
                child: Image.network(productImg),
              ),
              title: Text(title),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(
                      '\u{09F3}$price',
                      style: TextStyle(color: ThemeAndColor.whiteColor),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  Text("In Total: \u{09F3}${price * quantity}"),
                ],
              ),
              trailing: Column(
                children: [
                  Text("$quantity X"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
