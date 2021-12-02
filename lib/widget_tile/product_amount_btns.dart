import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductAmountBtns extends StatelessWidget {
  ProductAmountBtns({Key? key, required this.productId, required this.close})
      : super(key: key);

  final int productId;
  final Function close;

  final PublicController _publicController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return SizedBox(
            child: Row(
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
                    size: _publicController.size.value * .04,
                    color: Colors.white,
                  ),
                ),
                Obx(() => Text(
                      "${controller.itemQuantity(productId)}",
                      style: TextStyle(
                          fontSize: _publicController.size.value * .03,
                          color: Colors.white),
                    )),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => controller.increaseQuantity(productId),
                  icon: Icon(
                    Icons.add,
                    size: _publicController.size.value * .04,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
