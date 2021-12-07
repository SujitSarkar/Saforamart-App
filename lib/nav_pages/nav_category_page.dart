import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/category_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/nav_pages/cart_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/drawer.dart';
import 'package:safora_mart/widget_tile/product_grid.dart';

class NavCategoryPage extends StatefulWidget {
  const NavCategoryPage({Key? key}) : super(key: key);

  @override
  _NavCategoryPageState createState() => _NavCategoryPageState();
}

class _NavCategoryPageState extends State<NavCategoryPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  int _tabIndex = 0;
  final _autoSizeGroup = AutoSizeGroup();
  int _tempSubIndex = 0;

  final CategoryController _categoryController = Get.find();
  final CartController _cartController = Get.find();

  TabController? _nestedTabController;

  get itemBuilder => null;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
    _nestedTabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController!.dispose();
    List pges = [
      singlePageCategoryGrid(),
      singlePageCategoryGrid(),
      singlePageCategoryGrid(),
      singlePageCategoryGrid(),
      singlePageCategoryGrid(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    final Size size = MediaQuery.of(context).size;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0.0,
        title: Text('Category',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.black)),
        actions: [
          Center(
            child: InkWell(
              child: Stack(children: [
                Icon(
                  LineAwesomeIcons.bell,
                  color: Colors.grey.shade800,
                  size: publicController.size.value * .085,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(publicController.size.value * .007),
                    decoration: const BoxDecoration(
                        color: ThemeAndColor.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      '9+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: publicController.size.value * .02,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ]),
              onTap: () {},
            ),
          ),
          SizedBox(width: customWidth(.05)),
        ],
        bottom: _tabBar(publicController),
      ),
      drawer: NavigationDrawer(),
      body: _bodyUI(publicController, size),
    );
  }

  PreferredSize _tabBar(PublicController publicController) => PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: TabBar(
          onTap: (covariant) async {
            setState(() => _tabIndex = covariant);
          },
          isScrollable: true,
          controller: _tabController,
          indicator: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 3.5,
            color: ThemeAndColor.themeColor,
          ))),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: ThemeAndColor.themeColor,
          labelStyle: const TextStyle(
            color: ThemeAndColor.themeColor,
          ),
          unselectedLabelColor: ThemeAndColor.blackColor,
          physics: const BouncingScrollPhysics(),
          tabs: _categoryController.mainCategory
              .map((cat) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      cat,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ))
              .toList(),
        ),
      );

  Widget _bodyUI(PublicController publicController, Size size) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ///Sidebar
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 5.0),
          //   width: size.width * .23,
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: 10,
          //     itemBuilder: (_, index) => _sidebarTie(publicController, index),
          //   ),
          // ),
          TabBar(
            onTap: (covariant) async {
              setState(() => _tempSubIndex = covariant);
            },
            controller: _nestedTabController,
            padding: EdgeInsets.only(top: customWidth(0.01)),
            labelColor: ThemeAndColor.whiteColor,
            indicatorPadding: EdgeInsets.all(customWidth(0.01)),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: _nestedTabController!.index == _tempSubIndex
                  ? ThemeAndColor.themeColor
                  : ThemeAndColor.greyColor,
            ),
            unselectedLabelColor: ThemeAndColor.themeColor,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            tabs: const [
              Tab(
                text: "Sub One",
              ),
              Tab(
                text: "Sub Two",
              ),
              Tab(
                text: "Sub Three",
              ),
              Tab(
                text: "Sub Four",
              ),
              Tab(
                text: "Sub Five",
              ),
            ],
          ),

          ///Divider
          // Container(
          //     margin: const EdgeInsets.symmetric(vertical: 10.0),
          //     color: Colors.blueGrey,
          //     width: 0.5),

          ///Product Body
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              // child: TabBarView(
              //   controller: _nestedTabController,
              //   children: [
              //     singlePageCategoryGrid(),
              //     singlePageCategoryGrid(),
              //     singlePageCategoryGrid(),
              //     singlePageCategoryGrid(),
              //     singlePageCategoryGrid(),
              //   ],
              // ),
              child: singlePageCategoryGrid(),
            ),
          ),
        ],
      );

  GridView singlePageCategoryGrid() {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.9),
        itemCount: 10,
        itemBuilder: (_, index) => const ProductGrid(id: 1));
  }

  Widget _sidebarTie(PublicController publicController, int index) => InkWell(
        onTap: () {
          setState(() => _tempSubIndex = index);
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: publicController.size.value * .2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      boxShadow: [
                        BoxShadow(
                            color: ThemeAndColor.themeColor.withOpacity(0.2),
                            blurRadius: 2.0,
                            offset: const Offset(0, 5))
                      ]),
                  margin: EdgeInsets.symmetric(
                      horizontal: publicController.size.value * .015,
                      vertical: publicController.size.value * .015),
                  padding: EdgeInsets.symmetric(
                      horizontal: publicController.size.value * .015,
                      vertical: publicController.size.value * .015),
                  child: AutoSizeText(
                    "Sub Category $index",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade900),
                    group: _autoSizeGroup,
                  )),
            ),
            Visibility(
              visible: index == _tempSubIndex ? true : false,
              child: Container(
                height: publicController.size.value * .2,
                width: 3,
                color: ThemeAndColor.themeColor,
              ),
            )
          ],
        ),
      );
}
