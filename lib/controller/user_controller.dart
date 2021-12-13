import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safora_mart/models/country.dart';

class UserController extends GetxController {
  final Map<String, dynamic> _user = {
    "id": 1,
    "firstName": "John",
    "lastName": "Deo",
    "email": "example@example.com",
    "address": "Dhaka, Bangladesh",
    "country": "BD",
    "phone": 01533136884,
    "imageUrl":
        "https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png",
    "creditCard": "",
  };

  Map<String, dynamic> get user {
    return _user;
  }

  var isExpendOpen = true.obs;

  List<CountryModel> _countries = [];

  List<CountryModel> get countries {
    return _countries;
  }

  @override
  onInit() {
    super.onInit();
    readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');

    final ListCountryModel listData = listcountryModelFromJson(response);
    print("Data: $listData");

    _countries = listData.data;
  }

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        return File(xFile.path);
      }
    });
  }
}
