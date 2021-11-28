import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/order_item.dart';

class OrderScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeAndColor.whiteColor,
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) =>
              OrderItem(orderController.orders[index])),
    );
  }
}
