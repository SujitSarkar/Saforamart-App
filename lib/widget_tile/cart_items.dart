import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/pages/product_details_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/product_amount_inc.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int productId;
  final String productImg;
  final double price;
  final int quantity;
  final String title;

  CartItem({
    Key? key,
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
    required this.productImg,
  }) : super(key: key);

  PublicController _publicController = PublicController();

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
                    padding: const EdgeInsets.only(top: 4, right: 4, left: 4),
                    label: Text(
                      '\u{09F3}$price',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 16, color: ThemeAndColor.whiteColor),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  Row(
                    children: [
                      const Text("In Total: \u{09F3}"),
                      Text(
                        "${price * quantity}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
              trailing: Text.rich(
                TextSpan(
                    text: "$quantity",
                    style: Theme.of(context).textTheme.headline2,
                    children: [
                      TextSpan(
                          text: "x",
                          style: Theme.of(context).textTheme.bodyText2),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
