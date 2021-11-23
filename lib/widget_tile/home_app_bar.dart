import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/pages/cart_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class HomeAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const HomeAppBar({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () => scaffoldKey!.currentState!.openDrawer(),
              child: Icon(LineAwesomeIcons.bars,
                  color: Colors.grey.shade800,
                  size: publicController.size.value * .08)),
          const SizedBox(width: 8.0),
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(width: 1, color: Colors.grey.shade400)),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: publicController.size.value * .02),
                    Text(
                      'Search Product',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: publicController.size.value * .045),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          InkWell(
            child: Stack(children: [
              Icon(
                LineAwesomeIcons.shopping_cart_arrow_down,
                color: Colors.grey.shade800,
                size: publicController.size.value * .085,
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(publicController.size.value * .007),
                  decoration: const BoxDecoration(
                      color: ThemeAndColor.themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '9+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: publicController.size.value * .02,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
            ]),
            onTap: () => Get.to(() => const CartPage()),
          ),
          const SizedBox(width: 8.0),
          InkWell(
            child: Stack(children: [
              Icon(
                LineAwesomeIcons.bell,
                color: Colors.grey.shade800,
                size: publicController.size.value * .085,
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(publicController.size.value * .007),
                  decoration: const BoxDecoration(
                      color: ThemeAndColor.themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '9+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: publicController.size.value * .02,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
            ]),
            onTap: () => Get.to(() => const CartPage()),
          )
        ],
      ),
    );
  }
}
