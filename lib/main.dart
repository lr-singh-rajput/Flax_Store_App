import 'package:flutter/material.dart';
import 'package:flux_store/Screens/chekOut/order_completed.dart';
import 'package:flux_store/Screens/chekOut/payment_page.dart';
import 'package:flux_store/Screens/home/home_screen.dart';
import 'package:flux_store/Screens/home/widgets/discover.dart';
import 'package:flux_store/Screens/home/widgets/home_page.dart';
import 'package:flux_store/Screens/home/widgets/my_order_page.dart';
import 'package:flux_store/Screens/home/widgets/my_wishlist.dart';
import 'package:flux_store/Screens/home/widgets/search_page.dart';
import 'package:flux_store/Screens/splece/splace_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screens/splece/intro_page.dart';
import 'controllers/themeController.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find() gets the controller instance

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    //  getPages: app_routs.routes,
      theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:SplaceScreen()
    );
  }
}


