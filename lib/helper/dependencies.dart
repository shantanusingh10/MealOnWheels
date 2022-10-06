import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_on_wheels/controllers/popular_product_controller.dart';
import 'package:meal_on_wheels/data/api/api_client.dart';

import '../data/repository/popular_product_repo.dart';

Future<void> init()async{

  //Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: ""));

  //Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  ///Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));


}