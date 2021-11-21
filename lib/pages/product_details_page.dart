import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();

  get index => _productController.currentProductIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ThemeAndColor.whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ThemeAndColor.blackColor,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_outlined,
                color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _publicController.size.value * .04),
        child: Column(
          children: [
            //Product image
            Card(
              child: Container(
                height: _publicController.size.value * 0.9,
                decoration: BoxDecoration(
                    color: ThemeAndColor.whiteColor,
                    image: DecorationImage(
                        image: NetworkImage(
                            _productController.items[index].imageUrl))),
              ),
            ),
            //Rating and sold
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Rating",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        children: const [
                          Icon(Icons.star_border_purple500),
                          Icon(Icons.star_border_purple500),
                          Icon(Icons.star_border_purple500)
                        ],
                      )
                    ],
                  ),
                  const Text("Total Sold: 999"),
                ],
              ),
            ),
            //Product Name and Description
            Text(
              _productController.items[index].productTitle,
              style: TextStyle(
                  fontSize: _publicController.size.value * .06,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: _publicController.size.value * .05,
            ),
            Text(
              "Description: ${_productController.items[index].description}",
              style: TextStyle(
                  fontSize: _publicController.size.value * .05,
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: _publicController.size.value * .05,
            ),
            //Product Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Price:",
                        style: TextStyle(
                            fontSize: _publicController.size.value * .05,
                            fontWeight: FontWeight.w200)),
                    Text(
                      _productController.items[index].price.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: _publicController.size.value * .05,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: _publicController.size.value * .05,
                ),
                //Product Size
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.all(_publicController.size.value * .02),
                      margin: EdgeInsets.only(
                          right: _publicController.size.value * .02),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Small",
                        style: TextStyle(
                            fontSize: _publicController.size.value * .05,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(_publicController.size.value * .02),
                      margin: EdgeInsets.only(
                          right: _publicController.size.value * .02),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Medium",
                        style: TextStyle(
                            fontSize: _publicController.size.value * .05,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(_publicController.size.value * .02),
                      margin: EdgeInsets.only(
                          right: _publicController.size.value * .02),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Large",
                        style: TextStyle(
                            fontSize: _publicController.size.value * .05,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: _publicController.size.value * .05,
                ),
                //Product price and amount
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle,
                        size: _publicController.size.value * .08,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: _publicController.size.value * .05,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        size: _publicController.size.value * .08,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
