import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/app_tabs.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late final ScrollController _scrollController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
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
                height: publicController.size.value * 0.1,
              ),
              secondImage(publicController),
              SizedBox(
                height: publicController.size.value * 0.1,
              ),
              thirdImage(publicController),
              SizedBox(
                height: publicController.size.value * 0.1,
              ),
              const Text(
                "Popular Departments",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.start,
              ),
              // Expanded(
              //   child: NestedScrollView(
              //     controller: _scrollController,
              //     headerSliverBuilder: (BuildContext context, bool isScroll) {
              //       return [
              //         SliverAppBar(
              //           pinned: true,
              //           bottom: PreferredSize(
              //             preferredSize: const Size.fromHeight(50),
              //             child: TabBar(
              //               controller: _tabController,
              //               isScrollable: true,
              //               indicatorPadding: const EdgeInsets.all(0),
              //               indicatorSize: TabBarIndicatorSize.label,
              //               labelPadding: const EdgeInsets.only(right: 10),
              //               indicator: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.grey.withOpacity(0.2),
              //                       blurRadius: 7,
              //                       offset: const Offset(0, 0),
              //                     )
              //                   ]),
              //               tabs: const [
              //                 AppTabs(text: "New Arrivals"),
              //                 AppTabs(text: "Best Seller"),
              //                 AppTabs(text: "Most Populer"),
              //                 AppTabs(text: "Feature"),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ];
              //     },
              //     body: TabBarView(
              //       controller: _tabController,
              //       children: [
              //         Container(),
              //         Container(),
              //         Container(),
              //         Container(),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: publicController.size.value * .02,
              ),
              Container(
                width: publicController.size.value,
                height: publicController.size.value,
                color: Theme.of(context).primaryColor,
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
            return publicController.imageSlider[index];
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

  Widget secondImage(PublicController publicController) {
    return Container(
      width: publicController.size.value,
      height: publicController.size.value * .4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/1-1.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(publicController.size.value * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text("Get up to "),
                Text(
                  "20% OFF",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFff9933),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "SPORTS OUTFITS",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Collection",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Starting at ",
                  style: TextStyle(
                    fontSize: 10,
                    color: ThemeAndColor.greyColor,
                  ),
                ),
                Text(
                  "\$170.00",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: ThemeAndColor.starColorList[5].withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget thirdImage(PublicController publicController) {
    return Container(
      width: publicController.size.value,
      height: publicController.size.value * .4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/1-2.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(publicController.size.value * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Arrivals",
              style: TextStyle(
                color: ThemeAndColor.greyColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACCESSORIES",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ThemeAndColor.whiteColor,
                  ),
                ),
                Text(
                  "Collection",
                  style: TextStyle(
                    fontSize: 18,
                    color: ThemeAndColor.whiteColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Only From ",
                  style: TextStyle(
                    fontSize: 10,
                    color: ThemeAndColor.greyColor,
                  ),
                ),
                Text(
                  "\$90.00",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: ThemeAndColor.starColorList[5],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
