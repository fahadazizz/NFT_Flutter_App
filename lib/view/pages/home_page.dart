import 'dart:ui';

import 'package:first_project/models/nft_model.dart';
import 'package:first_project/view/home/appBar_homePage.dart';
import 'package:first_project/view/home/homeDrawer_page.dart';
import 'package:first_project/view/home/nft_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF8F8F8),
      body: CustomScrollView(
        scrollBehavior: ScrollBehavior(),
        slivers: [
          spaceForHome(20.0),
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
          spaceForHome(10.0),

          // body top text
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textHome('Discover, collect, and sell', 20, Color(0xFFFCFCFC),
                    Alignment.center),
                textHome('Your Digital Art', 32, Color(0xFFFCFCFC),
                    Alignment.center),
              ],
            ),
          ),
          spaceForHome(10.0),

          // search box
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF333333).withOpacity(0.8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search),
                  Text(
                    'Search items, collections, and accounts',
                    style: TextStyle(color: Color(0xFF888888), fontSize: 13),
                  ),
                  Icon(Icons.mic),
                ],
              ),
            ),
          ),

          // list of item of nft
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final nft = NftModel.nftList[index];
                return NftDesign(
                  nftImage: nft.image,
                  titles: nft.title,
                  logo: nft.logo,
                  userName: nft.userName,
                  passion: nft.passion,
                  onPress: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Button pressed'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
              childCount: NftModel.nftList.length,
            ),
          ),
        ],
      ),
    );
  }

  // body top text home page
  Widget textHome(String text, double size, Color color, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // space widget
  static Widget spaceForHome(hei) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: hei,
      ),
    );
  }
}
