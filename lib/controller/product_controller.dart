import 'package:get/get.dart';
import 'package:safora_mart/models/product.dart';

class ProductController extends GetxController {
  final List<Product> _items = [
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

  int currentProductIndex = 0;
}
