import 'dart:io';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/controller/user_controller.dart';
import 'package:safora_mart/models/country.dart';
import 'package:safora_mart/models/user.dart';
import 'package:safora_mart/static_variavles/form_decoration.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/text_field_edit_profile.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final PublicController _publicController = Get.find();

  final UserController _userController = Get.find();

  late Map<String, dynamic> _user;

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lasstNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  late String countryName = "";

  File? imageFile;

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
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: _publicController.size.value * 0.6,
                          height: _publicController.size.value * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                _publicController.size.value / 2),
                            border: Border.all(
                              color: Theme.of(context).primaryColorLight,
                              width: 2.2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                _publicController.size.value / 2),
                            child: imageFile == null
                                ? Image.network(
                                    "https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png",
                                    fit: BoxFit.cover)
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: _publicController.size.value / 12,
                          child: SizedBox(
                            height: _publicController.size.value / 15,
                            child: GestureDetector(
                                onTap: () async {
                                  ImagePicker _picker = ImagePicker();
                                  await _picker
                                      .pickImage(source: ImageSource.gallery)
                                      .then((xFile) {
                                    if (xFile != null) {
                                      setState(() {
                                        imageFile = File(xFile.path);
                                      });
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldEdit(
                            controller: firstNameController,
                            text: _user['firstName'],
                          ),
                        ),
                        SizedBox(
                          width: _publicController.size.value * 0.04,
                        ),
                        Expanded(
                          child: TextFieldEdit(
                            controller: lasstNameController,
                            text: _user['lastName'],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _publicController.size.value * 0.07,
                    ),
                    TextFieldEdit(
                      controller: phoneController,
                      text: _user['phone'].toString(),
                    ),
                    SizedBox(
                      width: _publicController.size.value * 0.04,
                    ),
                    TextFieldEdit(
                      controller: addressController,
                      text: _user['address'],
                    ),
                    SizedBox(
                      height: _publicController.size.value * 0.07,
                    ),
                    TextFieldEdit(
                      controller: emailController,
                      text: _user['email'],
                    ),
                    SizedBox(
                      height: _publicController.size.value * 0.07,
                    ),
                    FindDropdown<String>(
                      onChanged: (selectedItem) {
                        setState(() {
                          countryName = selectedItem ?? "";
                          print(countryName);
                        });
                      },
                      selectedItem: "No Country select",
                      label: "Select Country",
                      items: _userController.countries
                          .map((country) =>
                              "${country.name}, ${country.capital}")
                          .toList(),
                      labelStyle: Theme.of(context).textTheme.headline4,
                      showClearButton: true,
                      titleStyle: Theme.of(context).textTheme.headline4,
                      searchBoxDecoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          suffixIcon: Icon(Icons.edit)),
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
                ),
              );
            },
          ),
        ),
      );
}
