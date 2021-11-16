import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: HomeAppBar(scaffoldKey: _scaffoldKey),
        ),
        drawer: const NavigationDrawer(),
        body: _bodyUI(publicController),
      ),
    );
  }

  SingleChildScrollView _bodyUI(PublicController publicController) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ///Banner
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(
                    publicController.size.value * .02)),
                child: Image.asset('assets/banner.jpg',
                    height: publicController.size.value * .45, fit: BoxFit.cover),
              ),
              SizedBox(height: publicController.size.value * .03),

            ],
          ),
        ),
      );

}
