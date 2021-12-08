import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductAmountInc extends StatelessWidget {
  ProductAmountInc({
    Key? key,
    required this.productId,
    this.gap,
    this.isRounded = true,
    this.iconSize,
    this.textSize,
  }) : super(key: key);

  final int productId;
  final double? gap;
  final double? iconSize;
  final double? textSize;
  final bool isRounded;

  final PublicController _publicController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Row(
            children: [
              InkWell(
                onTap: () => _cartController.productQuantity.value > 1
                    ? _cartController.productQuantity.value--
                    : null,
                child: Icon(
                  isRounded ? Icons.remove_circle : Icons.remove,
                  size: iconSize ?? _publicController.size.value * .08,
                  color: isRounded
                      ? ThemeAndColor.blackColor.withOpacity(0.6)
                      : ThemeAndColor.themeColor,
                ),
              ),
              SizedBox(
                width: customWidth(gap ?? .025),
              ),
              Container(
                color: Colors.white,
                child: Obx(() => Text(
                      "${_cartController.productQuantity.value}",
                      style: TextStyle(
                          fontSize:
                              textSize ?? _publicController.size.value * .05,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    )),
              ),
              SizedBox(
                width: customWidth(gap ?? .025),
              ),
              InkWell(
                onTap: () => _cartController.productQuantity.value++,
                child: Icon(
                  isRounded ? Icons.add_circle : Icons.add,
                  size: iconSize ?? _publicController.size.value * .08,
                  color: isRounded
                      ? ThemeAndColor.blackColor.withOpacity(0.6)
                      : ThemeAndColor.themeColor,
                ),
              ),
            ],
          );
        });
  }
}
