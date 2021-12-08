import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:safora_mart/models/cartItem.dart';
import 'package:safora_mart/models/order.dart';
import 'package:safora_mart/models/product.dart';

class OrderController extends GetxController {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._demoOrder];
  }

  static const String description =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

  final List<Order> _demoOrder = [
    Order(
      orderId: 1,
      status: "Pending",
      amount: 1500,
      deliveyCharge: 30.00,
      products: [
        CartItem(
          id: "1",
          productTitle:
              "Wireless Controller for PS4™ dfgd gedgsdg edg getg egrrtg ",
          productPrice: 300.00,
          productImg: "assets/images/dove-lotion.jpg",
          productQuantity: 4,
        ),
        CartItem(
          id: "4",
          productTitle: "Logitech Head",
          productPrice: 300.00,
          productImg: "assets/images/Image Popular Product 2.png",
          productQuantity: 1,
        )
      ],
      purcheaseTime: DateTime.now(),
      delivaryTime: DateTime.now(),
    ),
    Order(
      orderId: 2,
      status: "Delivared",
      amount: 1200,
      deliveyCharge: 30.00,
      products: [
        CartItem(
          id: "1",
          productTitle: "Wireless Controller for PS4™",
          productPrice: 300.00,
          productImg: "assets/images/dove-lotion.jpg",
          productQuantity: 4,
        )
      ],
      purcheaseTime: DateTime.now(),
      delivaryTime: DateTime.now(),
    ),
  ];

  void addOrder(
    String status,
    List<CartItem> cartProducts,
    double total,
    double? deliveyCharge,
    DateTime purcheaseTime,
    DateTime delivaryTime,
  ) {
    _orders.insert(
        0,
        Order(
            orderId: int.parse(DateTime.now().toString()),
            products: cartProducts,
            amount: total,
            status: status,
            delivaryTime: purcheaseTime,
            purcheaseTime: purcheaseTime,
            deliveyCharge: deliveyCharge ?? 0.0));
    update();
  }
}
