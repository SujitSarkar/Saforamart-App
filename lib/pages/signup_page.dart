import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/home_nav.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PublicController _publicController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(_publicController.size.value * 0.05),
            child: Card(
              color: ThemeAndColor.whiteColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "SIGN UP",
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
                      lableText: "Name",
                    ),
                    textFormField(
                      controller: _emailController,
                      lableText: "Phone No",
                    ),
                    textFormField(
                      controller: _emailController,
                      lableText: "Email",
                    ),
                    passwordtextFromField(
                      controller: _passwordController,
                      lableText: "Password",
                      isObscure: _isObscure,
                    ),
                    passwordtextFromField(
                      controller: _passwordController,
                      lableText: "Confirm Password",
                      isObscure: _isObscure,
                    ),
                    textFormField(
                      controller: _emailController,
                      lableText: "Address",
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(_publicController.size.value * 0.03),
                      child: CheckboxListTile(
                        title: const Text("I agree to the privacy policy"),
                        value: _isAgreed,
                        onChanged: (_) {
                          setState(() {
                            _isAgreed = !_isAgreed;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(_publicController.size.value * 0.03),
                      child: ElevatedButton(
                          onPressed: () => Get.to(HomeNavPage()),
                          child: const Text("SIGN UP")),
                    )
                  ],
                ),
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
            labelText: lableText),
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
