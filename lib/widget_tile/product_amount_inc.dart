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
    this.iconColor,
  }) : super(key: key);

  final int productId;
  final double? gap;
  final double? iconSize;
  final double? textSize;
  final Color? iconColor;
  final bool isRounded;

  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => controller.productQuantity.value > 1
                    ? controller.productQuantity.value--
                    : controller.removeitem(productId),
                child: Obx(() => Icon(
                      controller.productQuantity.value < 2
                          ? Icons.delete
                          : isRounded
                              ? Icons.remove_circle
                              : Icons.remove,
                      size: iconSize ?? customWidth(.08),
                      color: isRounded
                          ? iconColor ??
                              ThemeAndColor.blackColor.withOpacity(0.6)
                          : iconColor ?? ThemeAndColor.themeColor,
                    )),
              ),
              SizedBox(
                width: customWidth(gap ?? .025),
              ),
              Container(
                child: Obx(() => Text(
                      "${controller.productQuantity.value}",
                      style: TextStyle(
                          fontSize: textSize ?? customWidth(.05),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    )),
              ),
              SizedBox(
                width: customWidth(gap ?? .025),
              ),
              InkWell(
                onTap: () => controller.productQuantity.value++,
                child: Icon(
                  isRounded ? Icons.add_circle : Icons.add,
                  size: iconSize ?? customWidth(.08),
                  color: isRounded
                      ? iconColor ?? ThemeAndColor.blackColor.withOpacity(0.6)
                      : iconColor ?? ThemeAndColor.themeColor,
                ),
              ),
            ],
          );
        });
  }
}
