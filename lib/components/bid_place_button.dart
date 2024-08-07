import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BidPlaceButton extends StatelessWidget {
  bool visible;
  VoidCallback onPress;
  String text;

  BidPlaceButton(
      {required this.visible, required this.onPress, required this.text});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 5),
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
            onPressed: onPress,
            child: Text(
              '$text',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0XFFFCFCFC),
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
