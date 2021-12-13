import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/config.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';

class ProductQuestionPage extends StatelessWidget {
  ProductQuestionPage({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();
  final ProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("Question Answer"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: _publicController.size.value * 0.48,
            child: commonTextField(
                context: context,
                hintText: "Write Your Question Here...",
                buttonText: "SUBMIT QUESTION",
                buttonPress: _productController.qaButtonPress),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text("View All QnA"),
          )
        ],
      ),
    );
  }

  Padding commonTextField(
          {required BuildContext context,
          required String hintText,
          required String buttonText,
          required Function buttonPress}) =>
      Padding(
        padding: EdgeInsets.all(_publicController.size.value * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _productController.reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 0.9,
                    ),
                  ),
                  hintText: hintText),
            ),
            ElevatedButton(onPressed: buttonPress(), child: Text(buttonText))
          ],
        ),
      );
}
