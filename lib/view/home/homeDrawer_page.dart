import 'package:flutter/material.dart';

import 'appBar_homePage.dart';

class HomedrawerPage extends StatelessWidget {
  const HomedrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarHomepage(
            images: 'assets/images/Logo.png',
            onPress: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_outlined),
          ),
        ],
      ),
    );
  }
}
