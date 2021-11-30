import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/static_variavles/widgets.dart';
import 'controller/public_controller.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({Key? key}) : super(key: key);

  @override
  _HomeNavPageState createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  int _bottomNavIndex = 0;

  AnimationController? _animationController;
  Animation<double>? animation;
  CurvedAnimation? curve;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration:
          const Duration(milliseconds: 300), //center button animation duration
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController!,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve!);
    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController!.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Widgets.mainNavBodyList.elementAt(_bottomNavIndex),
      floatingActionButton: ScaleTransition(
        scale: animation!,
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(LineAwesomeIcons.universal_access,
              color: Colors.white, size: publicController.size.value * .09),
          onPressed: () {
            _animationController!.reset();
            _animationController!.forward();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: Widgets.mainNavBodyList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? ThemeAndColor.themeColor : Colors.grey.shade800;
          return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Widgets.bottomNavIconList[index],
                  size: publicController.size.value * .08,
                  color: color,
                ),
                SizedBox(height: publicController.size.value * .01),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: publicController.size.value * .02),
                  child: AutoSizeText(
                    Widgets.bottomNavLabelList[index],
                    maxLines: 1,
                    style: TextStyle(color: color),
                    group: autoSizeGroup,
                  ),
                )
              ]);
        },
        backgroundColor: ThemeAndColor.whiteColor,
        activeIndex: _bottomNavIndex,
        splashColor: Theme.of(context).primaryColor,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 500,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        elevation: 0.0,
        leftCornerRadius: publicController.size.value * .04,
        rightCornerRadius: publicController.size.value * .04,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
