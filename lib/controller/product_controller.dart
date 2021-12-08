import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/models/product.dart';

class ProductController extends GetxController {
  final List<Product> _demoProducts = [
    Product(
      id: 1,
      images: [
        "assets/images/dove-lotion.jpg",
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      discount: 20.0,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Nike Sport White - Man Pant",
      price: 50.5,
      description: description,
      rating: 4.1,
      isPopular: true,
      discount: 10.0,
    ),
    Product(
      id: 3,
      images: [
        "assets/images/glap.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Gloves XC Omega - Polygon",
      price: 36.55,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
      discount: 0.0,
    ),
    Product(
      id: 4,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Logitech Head",
      price: 20.20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      discount: 0.0,
    ),
  ];

  static const String description =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

  List<Product> get items {
    return [..._demoProducts];
  }

  List<Product> get favouriteItems {
    return _demoProducts.where((element) => element.isFavourite!).toList();
  }

  Product findProductById(int id) {
    return _demoProducts.firstWhere((element) => element.id == id);
  }

  List<Product> findProductByName(String name) {
    return _demoProducts
        .where((element) => element.id == int.parse(name))
        .toList();
  }

  void toggleFavouriteStatus(int id) {
    Product _product = _demoProducts.firstWhere((element) => element.id == id);
    _product.isFavourite = !_product.isFavourite!;
    update();
  }

  int currentProductIndex = 0;

  TextEditingController reviewController = TextEditingController();
  TextEditingController qaController = TextEditingController();
  Function? reviewButtonPress() {
    print("reviewButtonPress pressed...");
  }

  Function? qaButtonPress() {
    print("reviewButtonPress pressed...");
  }
}
