import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/pages/checkout_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/cart_Items.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/nothing_to_show.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.find();
  OrderController orderController = Get.find();
  final PublicController _publicController = Get.find();
  final TextEditingController _coupon = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        elevation: 0.0,
        title: Text('Your Cart', style: Theme.of(context).textTheme.headline2),
        actions: [
          Center(
            child: InkWell(
              child: Stack(children: [
                Icon(
                  LineAwesomeIcons.bell,
                  color: Colors.grey.shade800,
                  size: _publicController.size.value * .085,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.all(_publicController.size.value * .007),
                    decoration: const BoxDecoration(
                        color: ThemeAndColor.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      '9+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _publicController.size.value * .02,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ]),
              onTap: () {},
            ),
          ),
          SizedBox(width: customWidth(.03)),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: bodyUI(context),
    );
  }

  GetBuilder<CartController> bodyUI(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (cont) => cartController.itemCount.isLowerThan(1)
          ? const NothingToShow(
              text: "Empty, no product added..",
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      listViewBuilder(),
                      const Divider(),
                      subTotalSection(context)
                    ],
                  ),
                ),
                bottomButton(context),
              ],
            ),
    );
  }

  ListView listViewBuilder() {
    return ListView.separated(
      separatorBuilder: (context, i) {
        return Divider(
          color: Theme.of(context).primaryColor.withOpacity(.1),
          thickness: 1.2,
        );
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: cartController.items.length,
      itemBuilder: (context, index) => CartItem(
        id: cartController.items.values.toList()[index].id,
        productId: cartController.items.keys.toList()[index],
        price: cartController.items.values.toList()[index].productPrice,
        quantity: cartController.items.values.toList()[index].productQuantity,
        title: cartController.items.values.toList()[index].productTitle,
        productImg: cartController.items.values.toList()[index].productImg,
      ),
    );
  }

  Container subTotalSection(BuildContext context) {
    return Container(
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
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: customWidth(0.045)),
              ),
              Text(
                '\u{09F3}${cartController.TotalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: customWidth(0.045),
                  fontWeight: FontWeight.bold,
                ),
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
          TextButton(
            onPressed: () => showBottomSheet(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(LineAwesomeIcons.alternate_money_check),
                SizedBox(
                  width: customWidth(.015),
                ),
                Text(
                  "Apply a voucher",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: customWidth(0.045),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(customWidth(.06)),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Voucher Code",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      customWidth(0.02),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      customWidth(0.02),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Apply voucher"),
              )
            ],
          ),
        );
      },
      context: context,
    );
  }

  Padding bottomButton(BuildContext context) {
    return Padding(
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
                      fontSize: customWidth(0.055),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: " (incl. VAT)",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: customWidth(0.03)),
                      ),
                    ]),
              ),
              SizedBox(
                width: _publicController.size.value * 0.02,
              ),
              Chip(
                label: Text(
                  '\u{09F3}${cartController.TotalAmount + 19}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
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
                  // Get.snackbar(
                  //   "Orders",
                  //   "Orders placed successfully",
                  //   backgroundColor: Colors.green,
                  //   snackPosition: SnackPosition.BOTTOM,
                  //   margin: const EdgeInsets.only(
                  //       bottom: 10, right: 10, left: 10),
                  // );
                  Get.to(() => CheckoutPage());
                },
                child: const Text('Review payment and address'),
                style: ElevatedButton.styleFrom(),
              );
            },
          ),
          SizedBox(
            height: customWidth(0.06),
          )
        ],
      ),
    );
  }
}
