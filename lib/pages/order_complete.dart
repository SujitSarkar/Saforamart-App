import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/controller/user_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

import '../config.dart';

class OrderCompletePage extends StatelessWidget {
  OrderCompletePage({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();

  final CartController cartController = Get.find();

  final OrderController orderController = Get.find();

  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(customWidth(0.04)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thankyou(context),
              SizedBox(
                height: customWidth(0.04),
              ),
              Text(
                "ORDER DETAILS",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black),
              ),
              orderDetails(context),
              SizedBox(
                height: customWidth(0.04),
              ),
              Text(
                "Billing Address",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black),
              ),
              addressCard(context),
              SizedBox(
                height: customWidth(0.04),
              ),
              Text(
                "Shipping Address",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black),
              ),
              addressCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Container thankyou(BuildContext context) {
    return Container(
      height: customWidth(.35),
      width: customWidth(.9),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ThemeAndColor.whiteColor,
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(customWidth(0.06)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: ThemeAndColor.themeColor,
              size: customWidth(0.1),
            ),
            Expanded(
              child: Text(
                "Thank you. Your order has been received.",
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2!.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card orderDetails(BuildContext context) {
    return Card(
      child: SizedBox(
        width: customWidth(.9),
        child: Padding(
          padding: EdgeInsets.all(customWidth(0.045)),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: cartController.items.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: customWidth(.7),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "${cartController.items.values.toList()[index].productQuantity}x ",
                              children: [
                                TextSpan(
                                  text:
                                      "${cartController.items.values.toList()[index].productTitle}",
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                            "${cartController.items.values.toList()[index].productPrice * cartController.items.values.toList()[index].productQuantity}")
                      ],
                    );
                  }),
              const Divider(),
              Container(
                padding: EdgeInsets.all(customWidth(.03)),
                width: customWidth(0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                        ),
                        Text(
                          '\u{09F3}${cartController.TotalAmount.toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Delivery fee"),
                        Text(
                          '\u{09F3} 19',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card addressCard(BuildContext context) {
    return Card(
      child: SizedBox(
        height: customWidth(.2),
        width: customWidth(.9),
        child: Padding(
          padding: EdgeInsets.all(customWidth(0.045)),
          child: Text(
            "${_userController.user['address']}",
          ),
        ),
      ),
    );
  }
}
