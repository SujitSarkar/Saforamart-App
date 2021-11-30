import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    return SafeArea(
      child: Drawer(
        elevation: 0.0,
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                ///Body
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: publicController.size.value * .4,
                    color: const Color(0xFF231f54),
                    child: Image.asset('assets/logo.png',
                        height: publicController.size.value * .12,
                        fit: BoxFit.contain)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: publicController.size.value * .03),
                  child: Column(
                    children: [
                      //SizedBox(height: publicController.size.value*.07),

                      const Divider(color: Colors.grey, height: 0.5),
                      _functionBuilder(
                          'Payment Method', LineAwesomeIcons.money_check),
                      const Divider(color: Colors.grey, height: 0.5),
                      _functionBuilder('Refund Policy', LineAwesomeIcons.undo),
                      const Divider(color: Colors.grey, height: 0.5),
                      _functionBuilder(
                          'About Us', LineAwesomeIcons.info_circle),
                      const Divider(color: Colors.grey, height: 0.5),
                      _functionBuilder(
                          'Privacy Policy', LineAwesomeIcons.user_secret),
                      const Divider(color: Colors.grey, height: 0.5),
                      SizedBox(height: publicController.size.value * .04),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _socialIconBuilder(LineAwesomeIcons.facebook),
                    _socialIconBuilder(LineAwesomeIcons.twitter),
                    _socialIconBuilder(LineAwesomeIcons.instagram),
                    _socialIconBuilder(LineAwesomeIcons.youtube),
                    _socialIconBuilder(LineAwesomeIcons.skype),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIconBuilder(IconData iconData) =>
      GetBuilder<PublicController>(builder: (publicController) {
        return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: publicController.size.value * .017,
              vertical: publicController.size.value * .01,
            ),
            child: Icon(
              iconData,
              size: publicController.size.value * .075,
              color: ThemeAndColor.themeColor,
            ),
          ),
        );
      });

  Widget _functionBuilder(String name, IconData iconData) =>
      GetBuilder<PublicController>(builder: (publicController) {
        return ListTile(
          onTap: () async {},
          leading: Icon(
            iconData,
            color: ThemeAndColor.themeColor.withOpacity(0.8),
            size: publicController.size.value * .07,
          ),
          title: Text(
            name,
            style: TextStyle(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w500,
                fontSize: publicController.size.value * .04),
          ),
          trailing: Icon(
            LineAwesomeIcons.angle_right,
            color: Colors.grey,
            size: publicController.size.value * .06,
          ),
        );
      });
}
