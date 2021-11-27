import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/controller/user_controller.dart';
import 'package:safora_mart/models/user.dart';
import 'package:safora_mart/static_variavles/form_decoration.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final PublicController _publicController = Get.find();

  final UserController _userController = Get.find();

  late Map<String, dynamic> _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeAndColor.whiteColor,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Container(
        child: _bodyUI(context, _publicController),
      ),
    );
  }

  Widget _bodyUI(BuildContext context, PublicController _publicController) =>
      SingleChildScrollView(
        child: SizedBox(
          width: _publicController.size.value,
          child: GetBuilder<UserController>(
            init: UserController(),
            initState: (_) {
              _user = _userController.user;
            },
            builder: (_) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: _publicController.size.value * 0.6,
                        height: _publicController.size.value * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              _publicController.size.value / 2),
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2.2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: _publicController.size.value / 12,
                        left: _publicController.size.value / 5.5,
                        child: SizedBox(
                          height: _publicController.size.value / 15,
                          child: Opacity(
                            opacity: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/camera-icon.png',
                                fit: BoxFit.contain,
                                width: _publicController.size.value * 0.3,
                                height: _publicController.size.value * 0.3,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _publicController.size.value * 0.04),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: const UnderlineInputBorder(),
                                labelText: "${_user['firstName']}",
                                suffixIcon: Icon(Icons.edit)),
                          ),
                        ),
                        SizedBox(
                          width: _publicController.size.value * 0.04,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: const UnderlineInputBorder(),
                                labelText: "${_user['lastName']}",
                                suffixIcon: Icon(Icons.edit)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _publicController.size.value * 0.07,
                  ),
                  ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    title: Text(
                      "Change Password",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: _publicController.size.value * 0.04,
                          ),
                    ),
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _publicController.size.value * 0.03,
                                ),
                                TextField(
                                  decoration: FormDecoration.formDecoration(
                                      _publicController.size.value,
                                      "Current Password"),
                                ),
                                SizedBox(
                                  height: _publicController.size.value * 0.03,
                                ),
                                TextField(
                                  decoration: FormDecoration.formDecoration(
                                      _publicController.size.value,
                                      "New Password"),
                                ),
                                SizedBox(
                                  height: _publicController.size.value * 0.03,
                                ),
                                TextField(
                                  decoration: FormDecoration.formDecoration(
                                      _publicController.size.value,
                                      "Repeat New assword"),
                                ),
                                SizedBox(
                                  height: _publicController.size.value * 0.03,
                                ),
                                OutlinedButton(
                                    onPressed: () {},
                                    child: const Text("Change Password"))
                              ],
                            ),
                          ))
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
}
