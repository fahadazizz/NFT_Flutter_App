import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarHomepage extends StatelessWidget {
  final VoidCallback? onPress;
  final String images;
  Icon icon;

  AppbarHomepage(
      {required this.images,
      this.onPress,
      required this.icon}); // Set onPress to be nullable

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Image.asset(images),
          ),
          IconButton(
            onPressed: onPress, // Use the onPress callback
            icon: icon,
          ),
        ],
      ),
    );
  }
}
