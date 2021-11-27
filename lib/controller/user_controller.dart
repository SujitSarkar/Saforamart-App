import 'package:get/state_manager.dart';
import 'package:safora_mart/models/User.dart';

class UserController extends GetxController {
  final Map<String, dynamic> _user = {
    "id": 1,
    "firstName": "John",
    "lastName": "Deo",
    "address": "Dhaka, Bangladesh",
    "natinality": "BD",
    "phone": 01533136884,
    "imageUrl":
        "https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png",
  };

  Map<String, dynamic> get user {
    return _user;
  }
}
