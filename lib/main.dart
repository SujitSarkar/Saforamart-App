import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:get/get.dart';
import 'package:safora_mart/splash_screen.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/static_variavles/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set Device orientation
  final bool _isPhone = Device.get().isPhone;
  SharedPreferences pref = await SharedPreferences.getInstance();
  if (_isPhone) {
    Widgets.portraitMood;
  } else {
    Widgets.landscapeMood;
  }
  pref.setBool('isPhone', _isPhone);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Saforamart',
        debugShowCheckedModeBanner: false,
        theme: ThemeAndColor.appTheme,
        home: const SplashScreen());
  }
}
