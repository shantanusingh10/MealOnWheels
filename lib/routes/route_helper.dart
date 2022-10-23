import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meal_on_wheels/pages/food/popular_food_detail.dart';
import 'package:meal_on_wheels/pages/food/recommended_food_detail.dart';

import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';

class RouteHelper{
  static String initial = '/';
  static String popularFood = '/popular-food';
  static String recommendedFood = '/recommended-food';
  static String cartPage = '/cart-page';
  static String splashPage = '/splash-page';

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId,String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),

    GetPage(name: popularFood, page: () {
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetail(pageId: int.parse(pageId!),page: page!);
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: () {
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!),page: page!);
    },
        transition: Transition.fadeIn
    ),
    GetPage(name: cartPage,page: (){
      return CartPage();
    },
    transition: Transition.fadeIn
    )
  ];
}