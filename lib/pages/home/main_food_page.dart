import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_on_wheels/pages/home/food_page_body.dart';
import 'package:meal_on_wheels/utils/dimensions.dart';
import 'package:meal_on_wheels/widgets/big_text.dart';
import 'package:meal_on_wheels/widgets/small_text.dart';

import '../../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "India",color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Hyderabad" ,color: Colors.black45),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconsize24)
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}