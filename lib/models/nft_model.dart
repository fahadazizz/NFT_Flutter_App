import 'dart:ui';

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

  static final List<NftModel> nftList = [
    NftModel(
        image: 'assets/images/itachi1.jpg',
        title: 'Uchiha Clan',
        logo: 'assets/images/image1.png',
        userName: 'Pawaki abc',
        passion: 'Creator',
        onPres: () {}),
  ];
}
