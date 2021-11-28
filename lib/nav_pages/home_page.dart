import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/app_tabs.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/banner_image.dart';
import 'package:safora_mart/widget_tile/category_wise_product.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/home_app_bar.dart';
import 'package:safora_mart/widget_tile/home_grid_view.dart';
import 'package:safora_mart/widget_tile/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<Widget> imageSliderHome = [
    bannerImage(
      img: "assets/1-1.jpg",
      firstLinetext1: "Get up to ",
      firstLinetext2: "20% OFF",
      secondLinetext: "SPORTS OUTFITS",
      thirdLinetext: "Collection",
      fourthLinetext1: "Starting at ",
      fourthLinetext2: "\$170.00",
      isDark: false,
    ),
    bannerImage(
      img: "assets/1-2.jpg",
      firstLinetext1: "New Arrivals",
      secondLinetext: "ACCESSORIES",
      thirdLinetext: "Collection",
      fourthLinetext1: "Only From ",
      fourthLinetext2: "\$90.00",
      isDark: true,
    ),
  ];

  final PublicController publicController = Get.find();
  @override
  Widget build(BuildContext context) {
    // final size = publicController.size.value;
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

  SingleChildScrollView _bodyUI(PublicController publicController) =>
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Banner
              bannerSlider(publicController),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),

              const HomeGridView(),
              SizedBox(
                height: publicController.size.value * .02,
              ),
              Container(
                width: publicController.size.value,
                height: publicController.size.value * 0.5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(publicController.size.value * .02),
                  image: const DecorationImage(
                      image: AssetImage("assets/banner.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Electronics"),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Health & Beauty"),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Cooking Essential"),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Fruits and Vegetable"),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Fashion"),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Organic"),
              SizedBox(
                height: publicController.size.value * 0.02,
              ),
              const CategoryWiseProduct(categoryTitle: "Games"),
              SizedBox(
                height: publicController.size.value * 0.08,
              ),
              const Text(
                "Popular Brands",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              brandSlider(publicController),
              SizedBox(
                height: publicController.size.value * 0.08,
              ),
            ],
          ),
        ),
      );

  Widget bannerSlider(PublicController publicController) {
    return SizedBox(
      width: publicController.size.value,
      height: publicController.size.value * .45,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(publicController.size.value * .02)),
        child: Swiper(
          itemCount: publicController.imageSlider.length,
          itemBuilder: (BuildContext context, int index) {
            return imageSliderHome[index];
          },
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
            ),
          ),
          control: const SwiperControl(),
          autoplay: true,
        ),
      ),
    );
  }

  Widget brandSlider(PublicController publicController) {
    return SizedBox(
      width: publicController.size.value,
      height: publicController.size.value * .45,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(publicController.size.value * .02)),
        child: Swiper(
          controller: SwiperController(),
          viewportFraction: 0.4,
          scale: 0.9,
          itemCount: publicController.brandSlider.length,
          itemBuilder: (BuildContext context, int index) {
            return brandBannerStructure(
                publicController.brandSlider[index]["img"],
                publicController.brandSlider[index]["name"]);
          },
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
            ),
          ),
          control: const SwiperControl(),
          autoplay: true,
        ),
      ),
    );
  }

  Container brandBannerStructure(String? img, String? brand) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: publicController.size.value * 0.02),
        padding: EdgeInsets.only(bottom: publicController.size.value * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(publicController.size.value * 0.5)),
              height: publicController.size.value * 0.25,
              child: Image.network(
                img!,
              ),
            ),
            Text(brand!),
            const SizedBox(height: 5),
          ],
        ),
      );
}
