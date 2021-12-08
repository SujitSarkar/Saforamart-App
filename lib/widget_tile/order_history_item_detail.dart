import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:safora_mart/models/order.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

import '../config.dart';

class OrderHistoryItemDetail extends StatelessWidget {
  OrderHistoryItemDetail({Key? key, required this.order}) : super(key: key);

  final Order order;

  double totalPrice = 0;
  double totalQuantity = 0;

  @override
  Widget build(BuildContext context) {
    order.products.forEach((element) {
      totalQuantity += element.productQuantity;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: customWidth(1),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: customWidth(.02)),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Text(
                  "Order ID: ${order.orderId.toString()}",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: customWidth(.02)),
                child: Text.rich(
                  TextSpan(
                    text: "Purchase Time: ",
                    children: [
                      TextSpan(
                        text: DateFormat.yMMMMd('en_US')
                            .format(order.purcheaseTime),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: customWidth(.02),
                  left: customWidth(.03),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total Items ${totalQuantity.toStringAsFixed(0)}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Divider(),
              ...order.products
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
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: customWidth(.025)),
                              child: Text(
                                '${product.productQuantity}X \u{09F3}${product.productPrice}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
              Divider(),
              Padding(
                padding: EdgeInsets.only(
                  top: customWidth(.02),
                  left: customWidth(.03),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Subtotal Price ${order.amount}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: customWidth(.02),
                  left: customWidth(.03),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Delivary charge ${order.deliveyCharge}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: customWidth(.02),
                  left: customWidth(.03),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total Price ${order.amount + order.deliveyCharge!}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: customWidth(.02)),
                child: Text.rich(
                  TextSpan(
                    text: "Delivary Time: ",
                    children: [
                      TextSpan(
                        text: DateFormat.yMMMMd('en_US')
                            .format(order.delivaryTime),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: customWidth(.02)),
                child: Text.rich(
                  TextSpan(
                    text: "Delivary Status: ",
                    children: [
                      TextSpan(
                        text: order.status,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ThemeAndColor.themeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
