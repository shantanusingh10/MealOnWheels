import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 844/220 = 3.84
  static double pageViewContainer = screenHeight/3.84;
  //844/120 = 7.03
  static double pageViewTextContainer = screenHeight/7.03;
  //844/320 = 2.64
  static double pageView = screenHeight/2.64;
// 844 /10 = 84.4
  static double height10 = screenHeight/84.4;
// 844/20 = 42.2
  static double height20 = screenHeight/42.2;
  static double height15 = screenHeight/56.27;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

//
  static double width10 = screenHeight/84.4;
// 844/20 = 42.2
  static double width20 = screenHeight/42.2;
  static double width15 = screenHeight/56.27;
  static double width30 = screenHeight/28.13;
  static double width45 = screenHeight/18.76;

  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;

  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  static double iconsize24 = screenHeight/35.17;
  static double iconsize16 = screenHeight/52.75;

  // 390/120
  static double listViewImgSize = screenWidth/3.25;
  //390/100
  static double listViewTextContSize = screenWidth/3.9;
  // 844/350
  static double popularFoodImgSize = screenHeight/2.41;
  //
  //844/120
  static double bottomHeightBar = screenHeight/7.02;
}