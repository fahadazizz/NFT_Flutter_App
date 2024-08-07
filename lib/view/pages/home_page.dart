import 'dart:ui';

import 'package:first_project/models/nft_model.dart';
import 'package:first_project/view/home/appBar_homePage.dart';
import 'package:first_project/view/home/homeDrawer_page.dart';
import 'package:first_project/view/home/nft_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF8F8F8),
      body: CustomScrollView(
        scrollBehavior: ScrollBehavior(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
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

          // body top text
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textHome('Discover, collect, and sell', 20, Color(0xFFFCFCFC),
                    Alignment.center),
                _textHome('Your Digital Art', 32, Color(0xFFFCFCFC),
                    Alignment.center),
              ],
            ),
          ),

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
          SliverToBoxAdapter(
            child: NftDesign(
              nftImage: 'assets/images/itachi1.jpg',
              titles: 'Itachi Uchiha',
              logo: 'assets/images/image1.png',
              userName: 'Sam karan',
              passion: 'Creator',
              minimumBid: 0.6,
            ),
          ),
          // NFT items list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _nftItems(context);
              },
              childCount: NftModel.nftList.length,
            ),
          ),
        ],
      ),
    );
  }

  // body top text home page
  Widget _textHome(String text, double size, Color color, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Widget for nft items
  Widget _nftItems(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0XFF333333).withOpacity(0.6),
            borderRadius: BorderRadius.circular(32),
          ),
          width: 330,
          height: 530,
          child: Column(
            children: [
              // main image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/itachi1.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // spacer
              const SizedBox(
                height: 15,
              ),

              // detial
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Uchiha Killer...',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0XFFFCFCFC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // user show
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image1.png'),
                ),
                title: const Text(
                  'Pawel Chizi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFFFCFCFC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Creator',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0XFFFCFCFC),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.favorite_border)),
              ),
            ],
          ),
        ),

        // spacer
        const SizedBox(
          height: 10,
        ),

        // minimum price bid
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Minimum Bid: ',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '1.50 ETH',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),

        // bid placer button
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 10),
          width: MediaQuery.of(context).size.width * 0.88,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              child: const Text(
                'Place Bid',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFFFCFCFC),
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),

        // artwork view button
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.88,
          height: 55,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              child: const Text(
                'View Artwork',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFFFCFCFC),
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),
        // for lower spacing
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  // placing bid button
  Widget _bidPlacing(context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.88,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {},
          child: const Text(
            'Place Bid',
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFFFCFCFC),
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
