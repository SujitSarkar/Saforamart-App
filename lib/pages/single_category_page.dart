import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/widget_tile/product_grid.dart';

class SingleCategoryPage extends StatelessWidget {
  SingleCategoryPage({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;
  final ProductController _productController = Get.find();

  final PublicController _publicController = Get.find();

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
          pageTitle,
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
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(customWidth(.04)),
                  child: Text("Items ${_productController.items.length}"),
                ),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Container(
                              height: customWidth(.05),
                              width: customWidth(.9),
                              color: Colors.white,
                            ));
                  },
                  icon: Icon(Icons.filter_list),
                  label: Text("Filter"),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 70,
            child: Container(
              color: Colors.grey.shade100,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: singlePageCategoryGrid(),
            ),
          ),
        ],
      ),
    );
  }

  GridView singlePageCategoryGrid() {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.9),
        itemCount: 4,
        itemBuilder: (_, index) =>
            ProductGrid(id: _productController.items[index].id));
  }
}
