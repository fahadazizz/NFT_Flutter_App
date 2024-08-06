import 'package:first_project/view/home/appBar_homePage.dart';
import 'package:first_project/view/home/homeDrawer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: ListView(
        children: [
          // app bar
          AppbarHomepage(
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

          // body top text
          _textHome('Discover, collect, and sell', 20, Color(0xFF555555),
              Alignment.center),
          _textHome(
              'Your Digital Art', 32, Color(0xFF222222), Alignment.center),

          // search box
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: 350,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0XFFF0F0F0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.search),
                Text(
                  'Search items, collections, and accounts',
                  style: TextStyle(color: Color(0xFF888888)),
                ),
                Icon(Icons.mic),
              ],
            ),
          ),

          _cardItemWithBid(
              'assets/images/Rectangle1.png',
              'Silent Voice...',
              'assets/images/Logo.png',
              'Pawel Czerwinski',
              'Creator',
              () {},
              () {}),
          // _placeBid(() {}, () {}),
          _cardItemWithOutBid(
              'assets/images/Rectangle1.png',
              'Silent Voice...',
              'assets/images/Logo.png',
              'Pawel Czerwinski',
              'Creator',
              '2.00 ETH'),
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

  // card for item
  Widget _cardItemWithBid(String image, String text, String logo, String name,
      String passion, VoidCallback onPress1, VoidCallback onPress2) {
    return SizedBox(
      width: 350,
      height: 700,
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            borderOnForeground: true,
            margin: EdgeInsets.all(10),
            color: Color(0xFFFFFFFF),
            shadowColor: Colors.grey.withOpacity(0.4),
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      const SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Image.asset(image),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: _textHome(
                            text, 20, Colors.black54, Alignment.centerLeft),
                      ),
                      ListTile(
                        leading: SizedBox(
                          width: 55,
                          height: 55,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(logo),
                          ),
                        ),
                        title: Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(passion),
                        trailing: Icon(Icons.favorite_border),
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0038F5),
                      Color(0xFF9F03FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 100],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Place Bid',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFF0038F5),
                      ),
                    ),
                    backgroundColor: Color(0xFFF8F8F8),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'View Art Network',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // card with out bid
  Widget _cardItemWithOutBid(String image, String text, String logo,
      String name, String passion, String price) {
    return SizedBox(
      width: 350,
      height: 700,
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            borderOnForeground: true,
            margin: EdgeInsets.all(10),
            color: Color(0xFFFFFFFF),
            shadowColor: Colors.grey.withOpacity(0.4),
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      const SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Image.asset(image),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: _textHome(
                            text, 20, Colors.black54, Alignment.centerLeft),
                      ),
                      ListTile(
                        leading: SizedBox(
                          width: 55,
                          height: 55,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(logo),
                          ),
                        ),
                        title: Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(passion),
                        trailing: Icon(Icons.favorite_border),
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sold for'),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
