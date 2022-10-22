import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:meal_on_wheels/controllers/popular_product_controller.dart';
import 'package:meal_on_wheels/controllers/recommended_product_controller.dart';
import 'package:meal_on_wheels/pages/cart/cart_page.dart';
import 'package:meal_on_wheels/pages/food/popular_food_detail.dart';
import 'package:meal_on_wheels/pages/food/recommended_food_detail.dart';
import 'package:meal_on_wheels/pages/home/food_page_body.dart';
import 'package:meal_on_wheels/pages/home/main_food_page.dart';

import 'package:meal_on_wheels/pages/home/main_food_page.dart';
import 'package:meal_on_wheels/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  //load dependencies
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await dep.init();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true; }}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}