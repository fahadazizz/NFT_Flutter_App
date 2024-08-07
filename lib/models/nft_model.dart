import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NftModel {
  String? image;
  String? title;
  String? logo;
  String? userName;
  String? passion;
  VoidCallback? onPres;

  NftModel({
    required this.image,
    required this.title,
    required this.logo,
    required this.userName,
    required this.passion,
    required this.onPres,
  });

  // list for items
  static final List<NftModel> nftList = [
    NftModel(
      image: 'assets/images/itachi1.jpg',
      title: 'Uchiha Clan',
      logo: 'assets/images/image1.png',
      userName: 'Pawaki abc',
      passion: 'Creator',
      onPres: () {},
    ),
    NftModel(
      image: 'assets/images/Rectangle1.png',
      title: 'Silver Head..',
      logo: 'assets/images/image1.png',
      userName: 'Amin xyz',
      passion: 'Designer',
      onPres: () {},
    ),
    NftModel(
      image: 'assets/images/itachi1.jpg',
      title: 'Uchiha Clan',
      logo: 'assets/images/image1.png',
      userName: 'Pawaki abc',
      passion: 'Creator',
      onPres: () {},
    ),
    NftModel(
      image: 'assets/images/Rectangle1.png',
      title: 'Silver Head..',
      logo: 'assets/images/image1.png',
      userName: 'Amin xyz',
      passion: 'Designer',
      onPres: () {},
    ),
  ];
}
