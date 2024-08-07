import 'package:first_project/components/bid_place_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NftDesign extends StatefulWidget {
  String? nftImage;
  String? titles;
  String? logo;
  String? userName;
  String? passion;
  VoidCallback? onPress;

  NftDesign({
    required this.nftImage,
    required this.titles,
    required this.logo,
    required this.userName,
    required this.passion,
    required this.onPress,
  });

  @override
  State<NftDesign> createState() => _NftDesignState();
}

class _NftDesignState extends State<NftDesign> {
  double minimumBid = 0.6;
  bool _visible = true;
  final bidController = TextEditingController();
  double? bid;
  @override
  Widget build(BuildContext context) {
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
                  '${widget.nftImage}',
                  fit: BoxFit.cover,
                ),
              ),

              // spacer
              const SizedBox(
                height: 15,
              ),

              // detail
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '${widget.titles}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0XFFFCFCFC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // user show
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('${widget.logo}'),
                ),
                title: Text(
                  '${widget.userName}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0XFFFCFCFC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  '${widget.passion}',
                  style: const TextStyle(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Minimum Bid: ',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '${minimumBid}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),

        // bid placer button
        Stack(
          children: [
            BidPlaceButton(
                visible: _visible,
                text: 'Place Bid',
                onPress: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _bottomSheet();
                      });
                }),
            Visibility(
              visible: !_visible,
              child: _viewArtNetwork('Bid Placed already at $bid'),
            ),
          ],
        ),

        // spacer
        const SizedBox(
          height: 10,
        ),
        // artwork view button
        _viewArtNetwork('View Artwork'),
        // for lower spacing
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  // bottom sheet
  Widget _bottomSheet() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: const Text('Place a bid'),
            subtitle: Text('You must bid at least ${minimumBid}'),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  bidController.clear();
                  bid = 0.0;
                },
                icon: const Icon(Icons.cancel_outlined)),
          ),
          SizedBox(
            width: 300,
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                label: Text('Enter your bid'),
              ),
              controller: bidController,
              onChanged: (value) {
                final String text = bidController.text;
                final double value = double.parse(text);
                setState(() {
                  if (value >= 0 && value <= 1000) {
                    bid = value;
                  }
                });
              },
            ),
          ),
          _bidPriceShow(),
          BidPlaceButton(
              visible: true,
              text: 'Confirm',
              onPress: () {
                setState(() {
                  _visible = false;
                  Navigator.pop(context);
                });
              }),
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
                onPressed: () {
                  Navigator.pop(context);
                  bidController.clear();
                  bid = 0.0;
                },
                child: const Text(
                  'Cancel Bid',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFFFCFCFC),
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  // bid price in bottom sheet
  Widget _bidPriceShow() {
    const double serviceFee = 0.15;
    final double bidValue =
        bid ?? 0.0; // Provide a default value if bid is null
    final double totalBid = serviceFee + bidValue;
    return Container(
      height: 120,
      margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Your Bid: '),
              Text(
                '$bid',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Service fee: '),
              Text(
                '$serviceFee',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total: '),
              Text(
                '$totalBid',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // art network view
  Widget _viewArtNetwork(String text) {
    return SizedBox(
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
          onPressed: widget.onPress,
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFFFCFCFC),
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
