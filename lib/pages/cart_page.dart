import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/order_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/widget_tile/cart_Items.dart';

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
    final PublicController publicController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        elevation: 0.0,
        title: const Text('Your Cart', style: TextStyle(color: Colors.black)),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        '₦${cartController.TotalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (context) {
                          return TextButton(
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
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.items.length,
                itemBuilder: (context, index) => CartItem(
                  id: cartController.items.values.toList()[index].id,
                  price:
                      cartController.items.values.toList()[index].productPrice,
                  quantity: cartController.items.values
                      .toList()[index]
                      .productQuantity,
                  title:
                      cartController.items.values.toList()[index].productTitle,
                  productId: cartController.items.keys.toList()[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
