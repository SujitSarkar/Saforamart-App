import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductAmountInc extends StatelessWidget {
  ProductAmountInc({Key? key, required this.productId}) : super(key: key);

  final int productId;

  final PublicController _publicController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Row(
            children: [
              IconButton(
                onPressed: () => controller.itemQuantity(productId) > 1
                    ? controller.decreaseQuantity(productId)
                    : null,
                icon: Icon(
                  Icons.remove_circle,
                  size: _publicController.size.value * .08,
                  color: ThemeAndColor.blackColor.withOpacity(0.6),
                ),
              ),
              Obx(() => Text(
                    "${controller.itemQuantity(productId)}",
                    style: TextStyle(
                        fontSize: _publicController.size.value * .05,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  )),
              IconButton(
                onPressed: () => controller.increaseQuantity(productId),
                icon: Icon(Icons.add_circle,
                    size: _publicController.size.value * .08,
                    color: ThemeAndColor.blackColor.withOpacity(0.6)),
              ),
            ],
          );
        });
  }
}
