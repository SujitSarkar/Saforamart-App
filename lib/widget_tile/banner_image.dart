import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

Widget bannerImage({
  required String img,
  required String firstLinetext1,
  String? firstLinetext2 = "",
  required String secondLinetext,
  required String thirdLinetext,
  required String fourthLinetext1,
  required String fourthLinetext2,
  required bool isDark,
}) {
  PublicController publicController = Get.find();
  return Container(
    width: publicController.size.value,
    height: publicController.size.value * .4,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          img,
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
            children: [
              Text(
                firstLinetext1,
                style: TextStyle(
                  color: !isDark
                      ? ThemeAndColor.blackColor
                      : ThemeAndColor.greyColor,
                ),
              ),
              Text(
                firstLinetext2 ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFff9933),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                secondLinetext,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: !isDark
                      ? ThemeAndColor.blackColor
                      : ThemeAndColor.whiteColor,
                ),
              ),
              Text(
                thirdLinetext,
                style: TextStyle(
                  fontSize: 18,
                  color: !isDark
                      ? ThemeAndColor.blackColor
                      : ThemeAndColor.whiteColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                fourthLinetext1,
                style: TextStyle(
                  fontSize: 10,
                  color: ThemeAndColor.greyColor,
                ),
              ),
              Text(
                fourthLinetext2,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: ThemeAndColor.secondaryColor.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
