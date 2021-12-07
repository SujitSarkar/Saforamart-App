import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/models/order.dart';
import 'dart:math';

import 'package:safora_mart/static_variavles/theme_and_color.dart';

class OrderItem extends StatefulWidget {
  final Order order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  double totalPrice = 0;
  double totalQuantity = 0;

  @override
  Widget build(BuildContext context) {
    widget.order.products.forEach((element) {
      totalQuantity += element.productQuantity;
    });
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order ID: ${widget.order.orderId.toString()}"),
                Text.rich(
                  TextSpan(
                    text: "Purchase Time: ",
                    children: [
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy hh:mm')
                            .format(widget.order.purcheaseTime),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Delivary Time: ",
                    children: [
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy hh:mm')
                            .format(widget.order.delivaryTime),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: "Delivary Status: ",
                      children: [
                        TextSpan(
                          text: widget.order.status,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ThemeAndColor.themeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                ...widget.order.products
                    .map(
                      (product) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: customWidth(.15),
                              height: customWidth(.15),
                              child: Image.asset(
                                product.productImg,
                                fit: BoxFit.contain,
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: customWidth(.7),
                                child: Text(
                                  product.productTitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${product.productQuantity}X \u{09F3}${product.productPrice}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
                Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: "Total: ",
                      children: [
                        TextSpan(
                          text: "Items ${totalQuantity.toStringAsFixed(0)}, ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "Price ${widget.order.amount}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
