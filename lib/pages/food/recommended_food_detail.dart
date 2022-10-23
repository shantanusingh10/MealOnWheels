import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_on_wheels/controllers/popular_product_controller.dart';
import 'package:meal_on_wheels/controllers/recommended_product_controller.dart';
import 'package:meal_on_wheels/pages/cart/cart_page.dart';
import 'package:meal_on_wheels/widgets/app_icon.dart';
import 'package:meal_on_wheels/widgets/big_text.dart';

import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page == "cartpage"){
                      Get.toNamed(RouteHelper.cartPage);
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                //AppIcon(icon: Icons.shopping_cart_outlined)
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      if(controller.totalItems>=1)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:0,top:0,

                            child: AppIcon(icon: Icons.circle,size: 20,
                              iconColor: Colors.transparent,backgroundColor: AppColors.mainColor,)):
                        Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:3,top:3,
                            child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                              size: 12,
                              color: Colors.white,
                            )):
                        Container()
                      ],
                    ),
                  );
                })
              ],
            ),
            bottom:  PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26,text: product.name!)),
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
              background: Image.network(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child: ExpandableTextWidget(text: product.description!,),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20)
                )
              ],
            )
          )
        ]
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20*2.5,
                      right: Dimensions.width20*2.5,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            controller.setQuantity(false);
                          },
                          child: AppIcon(iconSize: Dimensions.iconsize24,iconColor: Colors.white, backgroundColor: AppColors.mainColor,icon: Icons.remove)
                      ),
                      BigText(text: "Rs ${product.price!*10} X  ${controller.inCartItems} ",color: AppColors.mainColor,size: Dimensions.font26,),
                      GestureDetector(
                          onTap: (){
                            controller.setQuantity(true);
                          },
                          child: AppIcon(iconSize: Dimensions.iconsize24,iconColor: Colors.white, backgroundColor: AppColors.mainColor,icon: Icons.add)
                      )

                    ],
                  )
              ),
              Container(
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
                        child: Icon(
                            Icons.favorite,
                            color: AppColors.mainColor
                        )
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                        child: BigText(text: "Rs ${product.price!} add to cart", color: Colors.white,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor
                        ),
                      )
                    )
                  ],
                ),
              ),
            ]
        );
      })
    );
  }
}
