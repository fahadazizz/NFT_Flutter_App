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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        width: 340,
        height: 70,
        margin: EdgeInsets.all(8),
        // padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          elevation: 10,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _currentIndex == 0
                        ? Colors.grey.withOpacity(0.5)
                        : Colors.white,
                  ),
                  child: Icon(Icons.home_outlined),
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _currentIndex == 1
                        ? Colors.grey.withOpacity(0.5)
                        : Colors.white,
                  ),
                  child: Icon(Icons.category_outlined),
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _currentIndex == 2
                        ? Colors.grey.withOpacity(0.5)
                        : Colors.white,
                  ),
                  child: Icon(Icons.person_4_outlined),
                ),
                label: 'home'),
          ],
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ),
    );
  }

  List<dynamic> pages = [
    HomePage(),
    CreatorsPage(),
    ProfilePage(),
  ];
}
