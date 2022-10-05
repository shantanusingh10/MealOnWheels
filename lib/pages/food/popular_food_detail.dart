
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_on_wheels/utils/dimensions.dart';
import 'package:meal_on_wheels/widgets/app_icon.dart';
import 'package:meal_on_wheels/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Backgroung image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/image/image1.jpg"
                    )
                  )
                ),
              )
          ),
          //icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )
          ),
          //Intro to food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "samosa",),
                      SizedBox(height: Dimensions.height20),
                      BigText(text: "Introduction"),
                      SizedBox(height: Dimensions.height20),
                      Expanded(child : const SingleChildScrollView(child: ExpandableTextWidget(text: "Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia!                                    Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia!")))
                    ],
                  )
          ))

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.blueColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add,color: AppColors.blueColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              child: BigText(text: "Rs 100 add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
