import 'package:safora_mart/models/product.dart';

import 'cartItem.dart';

class Order {
  final int orderId;
  final String status;
  final double amount;
  final double? deliveyCharge;
  final List<CartItem> products;
  final DateTime purcheaseTime;
  final DateTime delivaryTime;

  Order({
    required this.orderId,
    required this.status,
    required this.amount,
    required this.products,
    required this.purcheaseTime,
    required this.delivaryTime,
    this.deliveyCharge = 30.00,
  });
}
