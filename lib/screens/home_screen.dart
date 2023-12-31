import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_card_maker/controllers/home_controller.dart';

import '../themes/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final HomeController c = Get.put(HomeController());

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    double width = screenWidth;
    if (screenHeight > screenWidth) {
      width = screenWidth;
    } else {
      width = screenHeight;
    }
    if (width > 480) {
      width = 480;
    }
    return Scaffold(
        appBar: AppBar(
          actions: [
            GetBuilder<ThemeController>(
              builder: (controller) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Switch(
                      activeThumbImage: AssetImage(
                          'assets/icons/sun.png'), // Replace with your sun icon asset
                      inactiveThumbImage: AssetImage(
                          'assets/icons/moon.png'), // Replace with your moon icon asset
                      activeColor: Colors.amber,
                      value: controller.isDark,
                      onChanged: (value) {
                        controller.changeTheme(value);
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 480,
                maxHeight: width * (3.375 / 2.0125)),
            width: width,
            child: AppinioSwiper(
              onSwipeBegin: (int a, int b, SwiperActivity swiperActivity) {
                log("a = ${a}, b = ${b} c.controller.state = ${c.controller.state}");
                if (!(c.controller.state?.isFront ?? true)) {
                  c.controller.toggleCardWithoutAnimation();
                }
              },
              loop: true,
              cardBuilder: (BuildContext context, int index) {
                return FlipCard(
                  controller: c.controller,
                  fill: Fill
                      .fillBack, // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL, // default
                  side: CardSide.FRONT, // The side to initially display.
                  front: Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text("Front ${index}"),
                    color: CupertinoColors.activeGreen,
                  ),
                  back: Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text("Back ${index}"),
                    color: CupertinoColors.activeBlue,
                  ),
                );
              },
              cardCount: 5,
            ),
          ),
        ));
  }
}
