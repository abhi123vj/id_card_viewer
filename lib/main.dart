import 'package:flutter/material.dart';
import 'package:id_card_maker/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:id_card_maker/screens/login_screen.dart';
import 'package:url_strategy/url_strategy.dart';

import 'helper/binding.dart';
import 'helper/shared_pref.dart';
import 'screens/unknown_screen.dart';
import 'themes/controller.dart';
import 'themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  setPathUrlStrategy();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (controller) => GetMaterialApp(
              initialRoute: '/login',
              unknownRoute:
                  GetPage(name: '/notfound', page: () => UnknownScreen()),
              getPages: [
                GetPage(
                  name: '/',
                  page: () => HomeScreen(),
                ),
                GetPage(
                  name: '/login',
                  page: () => LoginScreen(),
                )
              ],
              title: "Theme With Getx",
              debugShowCheckedModeBanner: false,
              initialBinding: Binding(),
              theme: Themes.light,
              darkTheme: Themes.dark,
              themeMode: controller.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const HomeScreen(),
            ));
  }
}
