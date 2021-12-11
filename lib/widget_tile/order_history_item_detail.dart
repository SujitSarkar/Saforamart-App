import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:safora_mart/models/order.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

import '../config.dart';

class OrderHistoryItemDetail extends StatefulWidget {
  OrderHistoryItemDetail({Key? key, required this.order}) : super(key: key);

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
        iconTheme: IconThemeData(color: Colors.black),
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
        child: Column(
          children: [
            _itemDetail(context),
            Expanded(
                child: Stepper(
              controlsBuilder: (context, details) {
                return Container();
              },
              currentStep: _currentIndex,
              steps: [
                Step(
                  title: Text("Packaging"),
                  content: Text("Image",
                      style: Theme.of(context).textTheme.headline1),
                  state: StepState.complete,
                  isActive: true,
                ),
                Step(
                  title: Text("Pending"),
                  content: Text("Image",
                      style: Theme.of(context).textTheme.headline1),
                  state: StepState.indexed,
                  isActive: true,
                ),
                Step(
                  title: Text("Deliver boy on the way"),
                  content: Text("Image",
                      style: Theme.of(context).textTheme.headline1),
                ),
                Step(
                  title: Text("Delivered"),
                  content: Text("Image",
                      style: Theme.of(context).textTheme.headline1),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Card _itemDetail(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
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
              ? TextStyle(fontWeight: FontWeight.w500)
              : TextStyle(fontWeight: FontWeight.normal),
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
