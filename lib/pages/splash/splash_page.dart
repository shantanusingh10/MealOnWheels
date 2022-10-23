import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_on_wheels/routes/route_helper.dart';
import 'package:meal_on_wheels/utils/dimensions.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
    super.initState();
    _loadResources();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    animation = CurvedAnimation(parent: controller,
        curve: Curves.linear);


    Timer(
       const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial())
    );
  }
  // @override
  // dispose() {
  //   controller.dispose(); // you need this
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset("assets/image/img1.png",width: Dimensions.width20*13,))),
          Center(child: Image.asset("assets/image/image1.jpg",width: Dimensions.width20*13,))
        ],
      ),
    );
  }
}
