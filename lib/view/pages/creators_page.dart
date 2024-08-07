import 'package:flutter/material.dart';
import '../home/appBar_homePage.dart';
import '../home/homeDrawer_page.dart';
import 'home_page.dart';

class CreatorsPage extends StatelessWidget {
  const CreatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomePage.spaceForHome(20.0),
          // app bar
          SliverToBoxAdapter(
            child: AppbarHomepage(
              images: 'assets/images/Logo.png',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomedrawerPage(),
                  ),
                );
              },
              icon: const Icon(Icons.menu_rounded),
            ),
          ),
          HomePage.spaceForHome(10.0),

          // body top text
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomePage().textHome('Discover creator', 25, Color(0xFFFCFCFC),
                    Alignment.center),
                SizedBox(
                  width: 250,
                  child: HomePage().textHome(
                      'Follow at least five creators to build your feed…',
                      16,
                      Color(0xFFFCFCFC),
                      Alignment.center),
                ),
              ],
            ),
          ),
          HomePage.spaceForHome(10.0),
        ],
      ),
    );
  }
}
