import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safora_mart/static_variavles/button.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

import '../config.dart';

class CategoryFilterPage extends StatefulWidget {
  const CategoryFilterPage({Key? key}) : super(key: key);

  @override
  _CategoryFilterPageState createState() => _CategoryFilterPageState();
}

class _CategoryFilterPageState extends State<CategoryFilterPage> {
  List sortBy = [
    "Popular",
    "Newest",
    "Customer Review",
    "Price: lowest to highest",
    "Price: highest to lowest",
  ];

  String sortedValue = "Popular";

  RangeValues _rangeSliderDiscreteValues = const RangeValues(50, 5000);

  List<String> sizeFliter = ["XS", "S", "M", "L", "XL"];
  String sizeFliterValue = "XS";

  int categorySelectedIndex = 0;

  List<String> brands = [
    "All Brands",
    "Samsung",
    "Realme",
    "Xiaomi",
    "Oppo",
    "Vivo",
    "OnePlus",
    "IPhone"
  ];

  List<int> selectedBrandsIndex = [0];

  void addBradindex(int i) {
    if (selectedBrandsIndex.contains(i)) {
      selectedBrandsIndex.remove(i);
    } else {
      selectedBrandsIndex.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: customWidth(1),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: customWidth(.04)),
          child: ListView(
            children: [
              // SizedBox(
              //   height: customWidth(.08),
              // ),
              //filter text
              Container(
                margin: EdgeInsets.all(customWidth(.02)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 50,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Filter",
                          style: TextStyle(fontSize: customWidth(0.05)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(FontAwesomeIcons.windowClose),
                    ),
                  ],
                ),
              ),
              Text(
                "Price Range",
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                // height: customWidth(.02),
                child: RangeSlider(
                  values: _rangeSliderDiscreteValues,
                  min: 0,
                  max: 10000,
                  labels: RangeLabels(
                    _rangeSliderDiscreteValues.start.round().toString(),
                    _rangeSliderDiscreteValues.end.round().toString(),
                  ),
                  onChanged: (values) {
                    setState(() {
                      _rangeSliderDiscreteValues = values;
                    });
                  },
                ),
              ),
              SizedBox(
                height: customWidth(.04),
              ),
              Text(
                "Size",
                style: Theme.of(context).textTheme.headline3,
              ),
              //Generate Size list
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Wrap(alignment: WrapAlignment.start, children: [
                  SizedBox(
                    width: customWidth(.05),
                  ),
                  ...sizeFliter
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            setState(() {
                              sizeFliterValue = e;
                            });
                          },
                          child: Container(
                            height: customWidth(.1),
                            width: customWidth(.1),
                            padding: EdgeInsets.all(customWidth(.02)),
                            margin: EdgeInsets.symmetric(
                              vertical: customWidth(.02),
                              horizontal: customWidth(.01),
                            ),
                            decoration: BoxDecoration(
                                color: sizeFliterValue == e
                                    ? ThemeAndColor.themeColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: sizeFliterValue == e
                                      ? ThemeAndColor.themeColor
                                      : Theme.of(context).dividerColor,
                                )),
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: sizeFliterValue == e
                                    ? ThemeAndColor.whiteColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()
                ]),
              ),
              SizedBox(
                height: customWidth(.04),
              ),
              Text(
                "Category",
                style: Theme.of(context).textTheme.headline3,
              ),
              //Generate Sub categoty list
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 2.5,
                    mainAxisExtent: customWidth(.15),
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  children: List<Widget>.generate(
                    5,
                    (int i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                categorySelectedIndex = i;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(customWidth(.02)),
                              margin: EdgeInsets.symmetric(
                                vertical: customWidth(.02),
                                horizontal: customWidth(.01),
                              ),
                              decoration: BoxDecoration(
                                  color: categorySelectedIndex == i
                                      ? ThemeAndColor.themeColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: categorySelectedIndex == i
                                        ? ThemeAndColor.themeColor
                                        : Theme.of(context).dividerColor,
                                  )),
                              alignment: Alignment.center,
                              child: Text(
                                'SubCategory$i',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: categorySelectedIndex == i
                                      ? ThemeAndColor.whiteColor
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: customWidth(.04),
              ),
              Text(
                "Brand",
                style: Theme.of(context).textTheme.headline3,
              ),
              //Generate Sub categoty list
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List<Widget>.generate(
                    brands.length,
                    (int i) {
                      return Builder(builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              addBradindex(i);
                              print("................Brands: $brands");
                              print(
                                  "................selectedBrands: $selectedBrandsIndex");
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: customWidth(.04)),
                                child: Text(
                                  brands[i],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: selectedBrandsIndex.contains(i)
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    color: selectedBrandsIndex.contains(i)
                                        ? ThemeAndColor.themeColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Checkbox(
                                activeColor: ThemeAndColor.themeColor,
                                onChanged: (bool? value) {
                                  setState(() {
                                    addBradindex(i);
                                  });
                                },
                                value: selectedBrandsIndex.contains(i),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: customWidth(.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SolidButton(
                    child: Text("Reset"),
                    onPressed: () {},
                    height: customWidth(.1),
                    width: customWidth(.45),
                    btnColor: Colors.redAccent,
                  ),
                  SolidButton(
                    child: Text("Apply"),
                    onPressed: () {
                      Get.back();
                    },
                    height: customWidth(.1),
                    width: customWidth(.45),
                    btnColor: ThemeAndColor.themeColor,
                  ),
                ],
              ),
              SizedBox(
                height: customWidth(.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
