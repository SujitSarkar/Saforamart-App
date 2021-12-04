import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductAmountWidget extends StatelessWidget {
  ProductAmountWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final int productId;

  final PublicController _publicController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => controller.itemQuantity(productId) > 1
                      ? controller.decreaseQuantity(productId)
                      : null,
                  icon: Icon(
                    Icons.remove,
                    size: _publicController.size.value * .2,
                    color: Colors.white,
                  ),
                ),
                Obx(() => Text(
                      "${controller.itemQuantity(productId)}",
                      style: TextStyle(
                          fontSize: _publicController.size.value * .025,
                          color: Colors.white),
                    )),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => controller.increaseQuantity(productId),
                  icon: Icon(
                    Icons.add,
                    size: _publicController.size.value * .02,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
