import 'package:first_project/view/pages/categories_page.dart';
import 'package:first_project/view/pages/creators_page.dart';
import 'package:first_project/view/pages/home_page.dart';
import 'package:first_project/view/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _currentIndex = 0;

  void setPage(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: pages[_currentIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomNavigationItems(
                    Icons.home_outlined,
                    0,
                    _currentIndex,
                    () => setPage(0),
                  ),
                  _bottomNavigationItems(
                    Icons.category_outlined,
                    1,
                    _currentIndex,
                    () => setPage(1),
                  ),
                  _bottomNavigationItems(
                    Icons.create_outlined,
                    2,
                    _currentIndex,
                    () => setPage(2),
                  ),
                  _bottomNavigationItems(
                    Icons.person_outline_outlined,
                    3,
                    _currentIndex,
                    () => setPage(3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // widget for custom bottom app bar items

  Widget _bottomNavigationItems(
      IconData icon, int index, int currentIndex, VoidCallback onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Icon(
            icon,
            color: currentIndex == index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  // list of pages to show for bottom app bar
  List<dynamic> pages = [
    HomePage(),
    CategoriesPage(),
    CreatorsPage(),
    ProfilePage(),
  ];
}
