import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/product_list.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();

  final TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  getProduct() {
    products = _productController.findProductByName(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeAndColor.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Colors.grey.shade800,
                        size: _publicController.size.value * .08),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(top: 2),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: "Search Product",
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      child: const Text("Search"),
                      onPressed: () {
                        print("Click............................");
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _publicController.size.value * .6,
              child: GetBuilder<ProductController>(
                init: ProductController(),
                initState: (_) {},
                builder: (_) {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return products.isEmpty
                          ? const Center(
                              child: Text("Nothing to show."),
                            )
                          : ProductList(id: products[index].id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
