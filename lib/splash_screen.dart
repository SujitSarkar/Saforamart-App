import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'home_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAll(() => const HomeNavPage()));
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.put(PublicController());
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xFF231f54),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
