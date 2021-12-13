import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/models/order.dart';

import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/order_history_item_detail.dart';

class OrderHistoryItem extends StatefulWidget {
  final Order order;

  OrderHistoryItem(
    this.order,
  );

  @override
  _OrderHistoryItemState createState() => _OrderHistoryItemState();
}

class _OrderHistoryItemState extends State<OrderHistoryItem> {
  double totalPrice = 0;
  double totalQuantity = 0;

  @override
  Widget build(BuildContext context) {
    widget.order.products.forEach((element) {
      totalQuantity += element.productQuantity;
    });
    return Padding(
      padding: EdgeInsets.all(customWidth(.025)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () =>
                      Get.to(() => OrderHistoryItemDetail(order: widget.order)),
                  child: Padding(
                    padding: EdgeInsets.all(customWidth(.025)),
                    child: Text(
                      "Order ID: ${widget.order.orderId.toString()}",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_right),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: customWidth(.025), bottom: customWidth(.015)),
            child: Text.rich(
              TextSpan(
                text: "Purchase Time: ",
                children: [
                  TextSpan(
                    text: DateFormat.yMMMMd('en_US')
                        .add_jm()
                        .format(widget.order.purcheaseTime),
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: customWidth(.025), bottom: customWidth(.015)),
            child: Text(
              "Total Items: ${totalQuantity.toStringAsFixed(0)}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: customWidth(.025), bottom: customWidth(.015)),
            child: Text(
              "Total Price: ${widget.order.amount}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: customWidth(.025), bottom: customWidth(.015)),
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
          Padding(
            padding: EdgeInsets.only(left: customWidth(.025)),
            child: Text.rich(
              TextSpan(
                text: "Delivary Time: ",
                children: [
                  TextSpan(
                    text: DateFormat.yMMMMd('en_US')
                        .format(widget.order.delivaryTime),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
