import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/controller/user_controller.dart';
import 'package:safora_mart/pages/edit_profile.dart';
import 'package:safora_mart/pages/order_complete.dart';
import 'package:safora_mart/pages/payment_method.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/cart_items.dart';
import 'package:safora_mart/widget_tile/nothing_to_show.dart';

import '../config.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final PublicController _publicController = Get.find();

  final CartController cartController = Get.find();

  final OrderController orderController = Get.find();

  final UserController _userController = Get.find();

  int _radioSelected = 1;
  late String _radioVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        elevation: 0.0,
        title: ListTile(
          title: Text('Checkout', style: Theme.of(context).textTheme.headline2),
          subtitle:
              Text('Saforamart', style: TextStyle(fontWeight: FontWeight.w400)),
        ),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    addInstruction(context),
                    locationCard(),
                    addressCard(context),
                    paymentMethod(context),
                    orderSummary(context),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "Total",
                            style: TextStyle(
                              fontSize: customWidth(0.05),
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: " (incl. VAT)",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontSize: customWidth(0.025)),
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: _publicController.size.value * 0.02,
                      ),
                      Text(
                        '\u{09F3}${cartController.TotalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: customWidth(.05)),
                      ),
                    ],
                  ),
                  GetBuilder<OrderController>(
                    init: OrderController(),
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          // orderController.addOrder(
                          //     cartController.items.values.toList(),
                          //     cartController.TotalAmount);
                          // cartController.clear();
                          Get.snackbar(
                            "Orders",
                            "Orders placed successfully",
                            backgroundColor: Colors.green,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.only(
                                bottom: 10, right: 10, left: 10),
                          );
                          Get.to(() => OrderCompletePage());
                        },
                        child: const Text('Place order'),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(customWidth(.045)),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(customWidth(.025)))),
                      );
                    },
                  ),
                  SizedBox(
                    height: customWidth(0.06),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container addInstruction(BuildContext context) {
    return Container(
      height: customWidth(.15),
      width: customWidth(.9),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ThemeAndColor.whiteColor,
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Text(
        "+ Add delivery instruction",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: ThemeAndColor.themeColor,
            ),
      ),
    );
  }

  Card locationCard() {
    return Card(
      child: SizedBox(
        height: customWidth(.25),
        width: customWidth(.9),
        child: Row(
          children: [
            SizedBox(
              width: customWidth(.4),
              child: RadioListTile<int>(
                contentPadding: EdgeInsets.all(0),
                title: Text("Inside Cumilla"),
                value: 1,
                groupValue: _radioSelected,
                activeColor: ThemeAndColor.themeColor,
                onChanged: (value) {
                  setState(() {
                    _radioSelected = value!;
                    _radioVal = 'Inside Cumilla';
                  });
                },
              ),
            ),
            SizedBox(
              width: customWidth(.4),
              child: RadioListTile<int>(
                contentPadding: EdgeInsets.all(0),
                title: Text("Outside Cumilla"),
                value: 2,
                groupValue: _radioSelected,
                activeColor: ThemeAndColor.themeColor,
                onChanged: (value) {
                  setState(() {
                    _radioSelected = value!;
                    _radioVal = 'Outside Cumilla';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card addressCard(BuildContext context) {
    return Card(
      child: SizedBox(
        height: customWidth(.25),
        width: customWidth(.9),
        child: Padding(
          padding: EdgeInsets.all(customWidth(0.045)),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: ThemeAndColor.themeColor,
                  ),
                  Text(
                    "Address",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_userController.user['address']}",
                  ),
                  GestureDetector(
                    onTap: () => Get.to(EditProfile()),
                    child: const Icon(
                      Icons.edit,
                      color: ThemeAndColor.themeColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card paymentMethod(BuildContext context) {
    return Card(
      child: SizedBox(
        height: customWidth(.25),
        width: customWidth(.9),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => PaymentMethodPage()),
                child: const Icon(
                  Icons.money_rounded,
                  color: ThemeAndColor.themeColor,
                ),
              ),
              Container(
                width: customWidth(0.08),
                height: customWidth(0.08),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/BKash-Logo.png",
                      ),
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Method",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black),
              ),
              Text("BKash")
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print("ONTAP..........");
                },
                child: const Icon(
                  Icons.edit,
                  color: ThemeAndColor.themeColor,
                ),
              ),
              Text(
                '\u{09F3}${cartController.TotalAmount}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card orderSummary(BuildContext context) {
    return Card(
      child: SizedBox(
        width: customWidth(.9),
        child: Padding(
          padding: EdgeInsets.all(customWidth(0.045)),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.receipt_long,
                    color: ThemeAndColor.themeColor,
                  ),
                  Text(
                    "Order summary",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: customWidth(0.04),
              ),
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

}
