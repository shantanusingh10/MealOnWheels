import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_on_wheels/controllers/popular_product_controller.dart';
import 'package:meal_on_wheels/data/api/api_client.dart';

import '../controllers/cart_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init()async{

  //Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
///
  //Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  ///Controller
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}