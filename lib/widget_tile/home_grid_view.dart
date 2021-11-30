import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/category_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({Key? key}) : super(key: key);

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView>
    with SingleTickerProviderStateMixin {
  // late final ScrollController _scrollController;

  late final TabController _tabController;
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // _scrollController = ScrollController();
  }

  final PublicController _publicController = Get.find();
  final CategoryController _categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: customWidth(.7),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: .8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: 30,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
              // color: Colors.blue.shade50,
              elevation: 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: customWidth(.018)),
                      child: Text(
                        "${_categoryController.categoryItems[0]["name"]} $index",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.network(
                      _categoryController.categoryItems[0]["img"],
                      height: customWidth(.22),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
