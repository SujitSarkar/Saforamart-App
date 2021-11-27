import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/order.dart';
import 'package:safora_mart/pages/edit_profile.dart';
import 'package:safora_mart/pages/order_page.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/drawer.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);
  final PublicController _publicController = Get.find();

  var profileSetting = [
    'Edit Profile',
    'App Settings',
    'Shipping Address',
    'Order History',
    'Cards',
  ];

  var profileSettingIcons = [
    Icons.person,
    Icons.settings,
    FontAwesomeIcons.mapMarker,
    FontAwesomeIcons.clipboard,
    Icons.credit_card,
  ];

  void getToNextPage(int index) {
    switch (index) {
      case 0:
        Get.to(() => EditProfile());
        break;
      case 3:
        Get.to(() => OrderScreen());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 1.0,
        title: Text(
          'Your Account',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 18, color: Colors.black),
        ),
      ),
      drawer: const NavigationDrawer(),
      body: _boduUI(context, _publicController),
    );
  }

  Widget _boduUI(BuildContext context, PublicController _publicController) =>
      SizedBox(
        width: _publicController.size.value,
        child: Column(
          children: [
            // Container(
            //   width: _publicController.size.value,
            //   height: _publicController.size.value,
            //   child: const CircleAvatar(
            //     foregroundImage: NetworkImage(
            //       "https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png",
            //     ),
            //     backgroundImage: NetworkImage(
            //       "http://www.mcicon.com/wp-content/uploads/2021/02/Technology_Camera_1-copy-25.jpg",
            //       scale: .5,
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: _publicController.size.value * 0.6,
              height: _publicController.size.value * 0.6,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(_publicController.size.value / 2),
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

            Text(
              "User Name.",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: _publicController.size.value * 0.045),
            ),
            SizedBox(
              height: _publicController.size.value * 0.07,
            ),
            SizedBox(
              height: _publicController.size.value,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: ThemeAndColor.greyColor,
                  );
                },
                itemCount: profileSetting.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => getToNextPage(index),
                    child: ListTile(
                      leading: Icon(profileSettingIcons[index]),
                      title: Text(
                        profileSetting[index],
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: _publicController.size.value * 0.04,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: _publicController.size.value * 0.04,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
