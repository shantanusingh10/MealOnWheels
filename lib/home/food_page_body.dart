import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_on_wheels/colors.dart';
import 'package:meal_on_wheels/widgets/big_text.dart';
import 'package:meal_on_wheels/widgets/icon_and_text_widget.dart';
import 'package:meal_on_wheels/widgets/small_text.dart';

import '../utils/dimensions.dart';

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
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){

              return _buildPageItem(position);
            }
        )),
    DotsIndicator(
    dotsCount: 5,
    position: _curPageValue,
    decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    )
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Samosa"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,size: 15)),
                      ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallText(text: "12489"),
                      SizedBox(width: 5,),
                      SmallText(text: "Reviews"),

                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
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
  }
}
