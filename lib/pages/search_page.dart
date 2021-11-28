import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back,
                          color: Colors.grey.shade800,
                          size: _publicController.size.value * .08)),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: "Search Product",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      _publicController.size.value * .045),
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text("Search"),
                    onPressed: () => getProduct(),
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
                      return ProductList(id: products[index].id);
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
