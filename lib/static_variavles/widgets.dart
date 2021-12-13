import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/nav_pages/account_page.dart';
import 'package:safora_mart/nav_pages/nav_category_page.dart';
import 'package:safora_mart/nav_pages/home_page.dart';
import 'package:safora_mart/pages/wishlist_page.dart';
import 'package:safora_mart/nav_pages/cart_page.dart';

class Widgets {
  static final List<Widget> mainNavBodyList = [
    const HomePage(),
    const NavCategoryPage(
      isFromHome: true,
    ),
    const CartPage(
      isFromHome: true,
    ),
    AccountPage(),
  ];

  static final bottomNavLabelList = [
    'Home',
    'Category',
    'My Cart',
    'Account',
  ];

  static final bottomNavIconList = [
    LineAwesomeIcons.home,
    LineAwesomeIcons.boxes,
    LineAwesomeIcons.shopping_cart_arrow_down,
    LineAwesomeIcons.user,
  ];

  static var portraitMood = SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  static var landscapeMood = SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}
