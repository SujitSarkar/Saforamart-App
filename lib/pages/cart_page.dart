import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/widget_tile/cart_Items.dart';
import 'package:safora_mart/widget_tile/nothing_to_show.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _coupon = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    var orderController = Get.put(OrderController());
    final PublicController _publicController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        elevation: 0.0,
        title: Text('Your Cart', style: Theme.of(context).textTheme.headline2),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => cartController.itemCount.isLowerThan(1)
            ? const NothingToShow(
                text: "Empty, no product added..",
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: _publicController.size.value * 0.02,
                        ),
                        Chip(
                          label: Text(
                            '\u{09F3}${cartController.TotalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        const Spacer(),
                        GetBuilder<OrderController>(
                            init: OrderController(),
                            builder: (context) {
                              return OutlinedButton(
                                  onPressed: () {
                                    orderController.addOrder(
                                        cartController.items.values.toList(),
                                        cartController.TotalAmount);
                                    cartController.clear();
                                    Get.snackbar(
                                      "Orders",
                                      "Orders placed successfully",
                                      backgroundColor: Colors.green,
                                      snackPosition: SnackPosition.BOTTOM,
                                      margin: const EdgeInsets.only(
                                          bottom: 10, right: 10, left: 10),
                                    );
                                  },
                                  child: const Text('ORDER NOW'));
                            })
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.items.length,
                      itemBuilder: (context, index) => CartItem(
                        id: cartController.items.values.toList()[index].id,
                        productId: cartController.items.keys.toList()[index],
                        price: cartController.items.values
                            .toList()[index]
                            .productPrice,
                        quantity: cartController.items.values
                            .toList()[index]
                            .productQuantity,
                        title: cartController.items.values
                            .toList()[index]
                            .productTitle,
                        productImg: cartController.items.values
                            .toList()[index]
                            .productImg,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
