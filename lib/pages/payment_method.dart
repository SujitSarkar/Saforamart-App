import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/controller/user_controller.dart';
import 'package:safora_mart/static_variavles/form_decoration.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/text_field_edit_profile.dart';

enum mainMethods { creditCard, other }
enum otherMethods { bcash, nogod, ucash }

class PaymentMethodPage extends StatefulWidget {
  PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final PublicController _publicController = Get.find();

  final UserController _userController = Get.find();

  final TextEditingController _cardController = TextEditingController();

  mainMethods mainMethod = mainMethods.creditCard;

  otherMethods otherMethod = otherMethods.bcash;

  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeAndColor.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Payment Method",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _publicController.size.value * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: _publicController.size.value * 0.15),
                child: Opacity(
                  opacity: .5,
                  child: Icon(
                    FontAwesomeIcons.moneyCheckAlt,
                    size: _publicController.size.value * 0.5,
                    color: ThemeAndColor.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Add Payment Method",
                    style: Theme.of(context).textTheme.headline1),
              ),
              ExpansionTile(
                initiallyExpanded: _userController.isExpendOpen.value,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Row(
                  children: [
                    const Icon(FontAwesomeIcons.moneyBillAlt),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Credit Card",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: _publicController.size.value * 0.04,
                          ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  FontAwesomeIcons.ccVisa,
                                  size: _publicController.size.value * 0.09,
                                ),
                                Icon(
                                  FontAwesomeIcons.ccPaypal,
                                  size: _publicController.size.value * 0.09,
                                ),
                                Icon(
                                  FontAwesomeIcons.ccMastercard,
                                  size: _publicController.size.value * 0.09,
                                ),
                                Icon(
                                  FontAwesomeIcons.ccAmex,
                                  size: _publicController.size.value * 0.09,
                                ),
                                Icon(
                                  FontAwesomeIcons.ccAmazonPay,
                                  size: _publicController.size.value * 0.09,
                                ),
                                Icon(
                                  FontAwesomeIcons.ccStripe,
                                  size: _publicController.size.value * 0.09,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _publicController.size.value * 0.03,
                            ),
                            TextFieldEdit(
                              controller: _cardController,
                              text: "XXXX-XXXX-XXXX",
                            ),
                            OutlinedButton(
                                onPressed: () {},
                                child: const Text("Add Credit-Card"))
                          ],
                        ),
                      ))
                ],
              ),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                onExpansionChanged: (value) {
                  _userController.isExpendOpen.toggle();
                },
                title: Row(
                  children: [
                    const Icon(FontAwesomeIcons.dollarSign),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Other",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: _publicController.size.value * 0.04,
                          ),
                    ),
                  ],
                ),
                children: [
                  SizedBox(
                    height: _publicController.size.value * 0.03,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: otherMethods.bcash,
                        groupValue: otherMethod,
                        onChanged: null,
                      ),
                      const Text("Bcash"),
                      Radio(
                        value: otherMethods.nogod,
                        groupValue: otherMethod,
                        onChanged: null,
                      ),
                      const Text("Nagad"),
                      Radio(
                        value: otherMethods.nogod,
                        groupValue: otherMethod,
                        onChanged: null,
                      ),
                      const Text("Other"),
                    ],
                  ),
                  SizedBox(
                    height: _publicController.size.value * 0.03,
                  ),
                  TextFieldEdit(
                    controller: _cardController,
                    text: "+880-1xx-xxx-xxxx",
                  ),
                  Center(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Add Number")),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
