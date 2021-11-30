import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/pages/signup_page.dart';
import 'package:safora_mart/static_variavles/form_decoration.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PublicController _publicController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(_publicController.size.value * 0.05),
            child: Card(
              color: ThemeAndColor.whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LOG IN",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(_publicController.size.value * 0.05),
                    child: const Divider(
                      thickness: 1.2,
                    ),
                  ),
                  textFormField(
                    controller: _emailController,
                    lableText: "password",
                  ),
                  passwordtextFromField(
                    controller: _passwordController,
                    lableText: "password",
                    isObscure: _isObscure,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(_publicController.size.value * 0.03),
                    child: ElevatedButton(
                        onPressed: () => Get.to(SignupPage()),
                        child: const Text("LOG IN")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textFormField(
      {required TextEditingController controller, required String lableText}) {
    return Padding(
      padding: EdgeInsets.all(_publicController.size.value * 0.03),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(_publicController.size.value * 0.02)),
            labelText: "Email"),
      ),
    );
  }

  Padding passwordtextFromField(
      {required TextEditingController controller,
      required String lableText,
      required bool isObscure}) {
    return Padding(
      padding: EdgeInsets.all(_publicController.size.value * 0.03),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(_publicController.size.value * 0.02),
          ),
          labelText: lableText,
          suffixIcon: IconButton(
            icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
        ),
        obscureText: _isObscure,
      ),
    );
  }
}
