import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/widget_tile/banner_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicController extends GetxController {
  RxBool isPhone = true.obs;
  SharedPreferences? preferences;
  RxDouble size = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    iniatializeApp();
  }

  Future<void> iniatializeApp() async {
    preferences = await SharedPreferences.getInstance();
    isPhone(preferences!.getBool('isPhone')!);

    if (isPhone.value) {
      size(MediaQuery.of(Get.context!).size.width);
    } else {
      size(MediaQuery.of(Get.context!).size.height);
    }
    update();
    print('IsPhone: ${isPhone.value}');
    print('Size: ${size.value}');
    print("Data Initialized !!!");
  }

  List<Widget> imageSlider = [
    Image.network(
      'http://saforamart.glamworlditltd.com/admin/slide_show/1636200656282311pexels-photo-3872406.jpeg',
      fit: BoxFit.cover,
    ),
    Image.network(
      'http://saforamart.glamworlditltd.com/admin/slide_show/1636200543174357pexels-photo-1656666.jpeg',
      fit: BoxFit.cover,
    ),
  ];

  List<Map<String, String>> brandSlider = [
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635858238-unnamed-(1).jpg',
      "name": "Apple",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635858279-images-(3).png',
      "name": "SUMSUNG",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635858417-47181298.jpg',
      "name": "Easy",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635858516-kiev-ukraine-march-31-2015-260nw-275940803.jpg',
      "name": "Nike",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1636514792-1.jpg',
      "name": "Walton",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1636521370-sailor.png',
      "name": "Sailor",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635857902-1537775322.jpg',
      "name": "Apex",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635858059-new_project_1.jpg',
      "name": "Pran",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635857829-47931ac4c8089968c5a1d6e5e61365ee.png',
      "name": "Bata",
    },
    {
      "img":
          'http://saforamart.glamworlditltd.com/admin/action/brand_icon/1635858154-download-(1).png',
      "name": "Fresh",
    },
  ];

  //For nestedScrollView
  final tabs = [
    "Category",
    "New Arrivals",
    "Best Seller",
    "Most Populer",
    "Feature",
    "Discount"
  ];

  //for Category section
  final List<Map<String, dynamic>> categoryItems = [
    {
      "img":
          "http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg",
      "title": "Dove Intensive Nourishement Lotion 400ml",
      "price": 400.00,
      "discount": 0.00,
    },
    {
      "img":
          "http://saforamart.glamworlditltd.com/admin/action/products_mul/1636521062-dove-lotion1.jpg",
      "title": "Dove Intensive Nourishement Lotion 400ml",
      "price": 400.00,
      "discount": 0.00,
    }
  ];
}
