import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/category_filter_page.dart';
import 'package:safora_mart/widget_tile/product_grid.dart';

class SingleCategoryPage extends StatefulWidget {
  SingleCategoryPage({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  final ProductController _productController = Get.find();

  final PublicController _publicController = Get.find();

  List sortBy = [
    "Popular",
    "Newest",
    "Customer Review",
    "Price: lowest to highest",
    "Price: highest to lowest",
  ];

  String sortedValue = "Popular";

  double priceRangeStart = 10;
  double priceRangeEnd = 1000;

  RangeValues _rangeSliderDiscreteValues = const RangeValues(40, 80);

  List<String> sizeFliter = ["XS", "S", "M", "L", "XL"];
  String sizeFliterValue = "XS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          widget.pageTitle,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(customWidth(.04)),
                    child: Text("Items ${_productController.items.length}"),
                  ),
                  GestureDetector(
                    onTap: () => showSortBottomSheet(
                      context,
                      customWidth(.9),
                      sortByList(context),
                    ),
                    child: Container(
                      height: customWidth(0.1),
                      width: customWidth(0.55),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(customWidth(.02)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: ThemeAndColor.themeColor.withOpacity(.4)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: "\u{21C5} ",
                          style: const TextStyle(fontWeight: FontWeight.w900),
                          children: [
                            TextSpan(
                                text: sortedValue,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return Dialog(
                      //       child: filterWidget(),
                      //     );
                      //   },
                      // );
                      Get.to(() => const CategoryFilterPage());
                    },
                    icon: const Icon(Icons.filter_list),
                    label: const Text("Filter"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: customWidth(.02), vertical: customWidth(.02)),
              child: singlePageCategoryGrid(),
            ),
          ),
        ],
      ),
    );
  }

  showSortBottomSheet(BuildContext context, double hight, Widget child) {
    Get.bottomSheet(
      Container(
        height: hight,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: child,
      ),
      isScrollControlled: true,
    );
  }

  ListView sortByList(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(customWidth(.04)),
          alignment: Alignment.center,
          child: Text(
            "Sort by",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: customWidth(.05)),
          ),
        ),
        ...sortBy
            .map(
              (e) => GestureDetector(
                onTap: () => setState(() {
                  sortedValue = e;
                  Navigator.pop(context);
                }),
                child: Container(
                  padding: EdgeInsets.all(customWidth(.04)),
                  alignment: Alignment.centerLeft,
                  color: e == sortedValue
                      ? ThemeAndColor.themeColor
                      : Colors.transparent,
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: customWidth(.04),
                          color: e == sortedValue ? Colors.white : Colors.black,
                        ),
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  GridView singlePageCategoryGrid() {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.7),
        itemCount: 4,
        itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.only(
                  left: customWidth(.01), top: customWidth(.01)),
              child: ProductGrid(id: _productController.items[index].id),
            ));
  }
}
