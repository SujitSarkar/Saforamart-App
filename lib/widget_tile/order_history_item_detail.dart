import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:safora_mart/models/order.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

import '../config.dart';

class OrderHistoryItemDetail extends StatefulWidget {
  const OrderHistoryItemDetail({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  State<OrderHistoryItemDetail> createState() => _OrderHistoryItemDetailState();
}

class _OrderHistoryItemDetailState extends State<OrderHistoryItemDetail> {
  double totalPrice = 0;
  double totalQuantity = 0;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    widget.order.products.forEach((element) {
      totalQuantity += element.productQuantity;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Order Item",
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _itemDetail(context),
              _orderStepper(),
            ],
          ),
        ),
      ),
    );
  }

  Stepper _orderStepper() {
    return Stepper(
      physics: const NeverScrollableScrollPhysics(),
      controlsBuilder: (BuildContext context, onStepCancel)=>Container(),
      currentStep: _currentIndex,
      steps: [
        Step(
          title: GestureDetector(
            onTap: () => setState(() {
              _currentIndex = 0;
            }),
            child: const Text("Packaging"),
          ),
          content: Container(),
          state: _currentIndex > 0
              ? StepState.complete
              : _currentIndex == 0
                  ? StepState.editing
                  : StepState.indexed,
          isActive: _currentIndex >= 0,
        ),
        Step(
          title: GestureDetector(
            onTap: () => setState(() {
              _currentIndex = 1;
            }),
            child: const Text("Pending"),
          ),
          content: Container(),
          state: _currentIndex > 1
              ? StepState.complete
              : _currentIndex == 1
                  ? StepState.editing
                  : StepState.indexed,
          isActive: _currentIndex >= 1,
        ),
        Step(
          title: GestureDetector(
            onTap: () => setState(() {
              _currentIndex = 2;
            }),
            child: const Text("Deliver boy on the way"),
          ),
          content: Container(),
          state: _currentIndex > 2
              ? StepState.complete
              : _currentIndex == 2
                  ? StepState.editing
                  : StepState.indexed,
          isActive: _currentIndex >= 2,
        ),
        Step(
          title: GestureDetector(
            onTap: () => setState(() {
              _currentIndex = 3;
            }),
            child: const Text("Delivered"),
          ),
          content: Container(),
          state: _currentIndex > 3
              ? StepState.complete
              : _currentIndex == 3
                  ? StepState.editing
                  : StepState.indexed,
          isActive: _currentIndex >= 3,
        ),
      ],
    );
  }

  Card _itemDetail(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: customWidth(1),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: customWidth(.02)),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Text(
              "Order ID: ${widget.order.orderId.toString()}",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          _customeStyledText(
            text1: "Purchase Time : ",
            text2:
                DateFormat.yMMMMd('en_US').format(widget.order.purcheaseTime),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _customeStyledText(
              text1: "Total Items : ",
              text2: totalQuantity.toStringAsFixed(0),
              isTitleBold: true,
            ),
          ),
          const Divider(),
          ..._orderedProductsList(),
          const Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: _customeStyledText(
              text1: "Subtotal Price : ",
              text2: "${widget.order.amount}",
              isTitleBold: true,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _customeStyledText(
              text1: "Delivary charge : ",
              text2: "${widget.order.deliveyCharge}",
              isTitleBold: true,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _customeStyledText(
              text1: "Total Price : ",
              text2: "${widget.order.amount + widget.order.deliveyCharge!}",
              isTitleBold: true,
            ),
          ),
          _customeStyledText(
            text1: "Delivary Time : ",
            text2: DateFormat.yMMMMd('en_US').format(widget.order.delivaryTime),
          ),
          _customeStyledText(
            text1: "Delivary Status : ",
            text2: widget.order.status,
            text2Colors: ThemeAndColor.themeColor,
          ),
          SizedBox(
            height: customWidth(.03),
          )
        ],
      ),
    );
  }

  Padding _customeStyledText({
    required String text1,
    required String text2,
    Color? text2Colors,
    bool isTitleBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: customWidth(.02), left: customWidth(.03)),
      child: Text.rich(
        TextSpan(
          text: text1,
          style: isTitleBold
              ? const TextStyle(fontWeight: FontWeight.w500)
              : const TextStyle(fontWeight: FontWeight.normal),
          children: [
            TextSpan(
              text: text2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: text2Colors ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _orderedProductsList() {
    return widget.order.products
        .map(
          (product) => ListTile(
            leading: SizedBox(
              width: customWidth(.15),
              height: customWidth(.15),
              child: Image.asset(
                product.productImg,
                fit: BoxFit.contain,
              ),
            ),
            title: Text(
              product.productTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${product.productQuantity}X \u{09F3}${product.productPrice}',
            ),
          ),
        )
        .toList();
  }
}
