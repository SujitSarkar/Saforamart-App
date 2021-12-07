import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/models/order.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/order_item.dart';

class OrderScreen extends StatelessWidget {
  final OrderController _orderController = Get.find();
  final List<Order> _orders = [];

  OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      initState: (_) {
        _orders.addAll(_orderController.orders);
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: ThemeAndColor.whiteColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Yours Orders",
              style: Theme.of(context).textTheme.headline2,
            ),
            actions: [
              Center(
                child: Text(
                  "Pending Order: ${_orderController.orders.where((element) => element.status == "Pending").length}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: ThemeAndColor.themeColor),
                ),
              ),
              SizedBox(
                width: customWidth(.03),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) => OrderItem(_orders[index])),
        );
      },
    );
  }
}
