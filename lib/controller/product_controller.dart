import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:safora_mart/models/product.dart';

class ProductController extends GetxController {
  final List<Product> _items = [
    Product(
        id: 0,
        productTitle: 'Dove Intensive Nourishement Lotion 400ml',
        description: 'Made for you Check it out!',
        price: 400.00,
        imageUrl:
            'http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg',
        discount: 0.00),
    Product(
        id: 1,
        productTitle: 'Dove Intensive Nourishement Lotion 400ml',
        description: 'Made for you Check it out!',
        price: 400.00,
        imageUrl:
            'http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg',
        discount: 0.00),
    Product(
        id: 2,
        productTitle: 'Dove Intensive Nourishement Lotion 400ml',
        description: 'Made for you Check it out!',
        price: 400.00,
        imageUrl:
            'http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg',
        discount: 0.00),
    Product(
        id: 3,
        productTitle: 'Dove Intensive Nourishement Lotion 400ml',
        description: 'Made for you Check it out!',
        price: 400.00,
        imageUrl:
            'http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg',
        discount: 0.00),
    Product(
        id: 4,
        productTitle: 'Dove Intensive Nourishement Lotion 400ml',
        description: 'Made for you Check it out!',
        price: 400.00,
        imageUrl:
            'http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg',
        discount: 0.00),
    Product(
        id: 5,
        productTitle: 'Dove Intensive Nourishement Lotion 400ml',
        description: 'Made for you Check it out!',
        price: 400.00,
        imageUrl:
            'http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg',
        discount: 0.00),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((element) => element.isFavourite).toList();
  }

  Product findProductById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> findProductByName(String name) {
    return _items.where((element) => element.id == int.parse(name)).toList();
  }

  void toggleFavouriteStatus(int id) {
    _items[id].isFavourite = !_items[id].isFavourite;
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
