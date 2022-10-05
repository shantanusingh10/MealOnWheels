import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_on_wheels/utils/colors.dart';
import 'package:meal_on_wheels/widgets/big_text.dart';
import 'package:meal_on_wheels/widgets/icon_and_text_widget.dart';
import 'package:meal_on_wheels/widgets/small_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _curPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //Slider section
          height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){

              return _buildPageItem(position);
            }
        )),
        //Dots
        new DotsIndicator(
    dotsCount: 5,
    position: _curPageValue,
    decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        //Popular list
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26,)
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing",),
              ),
            ],
          ),
        ),
        //List of popular items
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //Image section
                      Container(

                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/image/img1.png"
                                )
                            )
                        ),
                      ),
                      //Text area
                      Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius20),
                                  bottomRight: Radius.circular(Dimensions.radius20)
                              ),
                              color: Colors.white,

                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Paneer Butter Masala tikka"),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(text: "Made with cottage cheese"),
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(icon: Icons.circle_sharp,
                                          text: "normal",
                                          iconColor: AppColors.iconColor1),
                                      IconAndTextWidget(icon: Icons.location_on,
                                          text: "2.5km",
                                          iconColor: AppColors.mainColor),
                                      IconAndTextWidget(icon: Icons.access_time_rounded,
                                          text: "15min",
                                          iconColor: AppColors.iconColor2),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                      )
                    ],
                  ),
                );
              }),
      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4  matrix = new Matrix4.identity();
    if(index == _curPageValue.floor()){
      var curScale = 1 - (_curPageValue - index)*(1-_scaleFactor);
      var _curTrans  = _height*(1-curScale)/2;
      matrix = Matrix4.diagonal3Values(1,curScale,1)..setTranslationRaw(0,_curTrans,0);

    }else if(index == _curPageValue.floor()+1){
      var curScale = _scaleFactor + (_curPageValue - index+1)*(1-_scaleFactor);
      var _curTrans  = _height*(1-curScale)/2;
      matrix = Matrix4.diagonal3Values(1,curScale,1);
      matrix = Matrix4.diagonal3Values(1,curScale,1)..setTranslationRaw(0,_curTrans,0);
    }else if(index == _curPageValue.floor()-1){
      var curScale = 1 - (_curPageValue - index)*(1-_scaleFactor);
      var _curTrans  = _height*(1-curScale)/2;
      matrix = Matrix4.diagonal3Values(1,curScale,1);
      matrix = Matrix4.diagonal3Values(1,curScale,1)..setTranslationRaw(0,_curTrans,0);
    }else{
      var curScale = 0.8;
      var _curTrans  = _height*(1-curScale)/2;
      matrix = Matrix4.diagonal3Values(1,curScale,1)..setTranslationRaw(0,_curTrans,0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven ? Color(0xFF69c5df):Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/image/image1.jpg"
                )
            )
        ),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(

              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5,0)
                    ),

                  ]
              ),
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: 30),
              child: AppColumn(text: "samosa"),
            ),
            ),
        )
        ],
      ),
    );
  }
}
