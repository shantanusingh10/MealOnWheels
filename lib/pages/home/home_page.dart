import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_on_wheels/pages/home/main_food_page.dart';
import 'package:meal_on_wheels/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page"))),
    Container(child: Center(child: Text("Next 2 Page"))),
    Container(child: Center(child: Text("Next 3  Page"))),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          showUnselectedLabels: false,
          onTap: onTapNav,
          items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "history",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "me",
          ),
        ]
      ),

    );
  }
}
