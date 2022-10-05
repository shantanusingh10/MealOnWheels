import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_on_wheels/widgets/app_icon.dart';
import 'package:meal_on_wheels/widgets/big_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom:  PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26,text: "Samosa")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
              )
            ),
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.brown,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/image1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child: ExpandableTextWidget(text: '  "Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia!                                    Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia!"   "Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia!                                    Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia! Widely considered a quintessentially Indian delicacy, few people know that the samosa does not have an Indian origin. Yes, you read that right. The deep fried, tightly pack of spicy goodness that we thought belonged to India is actually a delicious and well-travelled immigrant from Central Asia!"',),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20)
                )
              ],
            )
          )
        ]
      ),
    );
  }
}
