import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/home_app_bar.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final PublicController _publicController = PublicController();

  List tabBarList = const [
    Text("All Categories"),
    Text("Electronics"),
    Text("Health & Beauty"),
    // Text("Cooking Essential"),
    // Text("Fruits and Vegetable"),
    // Text("Fashion"),
    // Text("Organic"),
    // Text("Games"),
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ThemeAndColor.whiteColor,
          iconTheme: const IconThemeData(color: Colors.grey),
          elevation: 1.0,
          bottom: TabBar(
            controller: _tabController,
            labelColor: ThemeAndColor.blackColor,
            labelPadding: EdgeInsets.all(_publicController.size.value * 0.03),
            labelStyle: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: _publicController.size.value * 0.04),
            unselectedLabelColor: ThemeAndColor.blackColor.withOpacity(0.6),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            isScrollable: true,
            tabs: [
              Text("All Categories"),
              Text("Electronics"),
              Text("Health & Beauty"),
            ],
          ),
        ),
        drawer: const NavigationDrawer(),
        body: _bodyUI(_publicController),
      ),
    );
  }

  SingleChildScrollView _bodyUI(PublicController publicController) =>
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _publicController.size.value * 1,
            ),
            SizedBox(
              height: _publicController.size.value * 0.12,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                labelColor: ThemeAndColor.blackColor,
                labelPadding:
                    EdgeInsets.all(_publicController.size.value * 0.03),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: _publicController.size.value * 0.04),
                unselectedLabelColor: ThemeAndColor.blackColor.withOpacity(0.6),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w500),
                isScrollable: false,
                tabs: [...tabBarList],
              ),
            ),
            SizedBox(
              height: _publicController.size.value * 0.5,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text("All Categories"),
                  Text("Electronics"),
                  Text("Health & Beauty"),
                ],
              ),
            ),
          ],
        ),
      );
}
