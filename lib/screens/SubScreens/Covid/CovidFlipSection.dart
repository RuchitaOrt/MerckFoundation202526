import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/Healthcare.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/childrenyouth.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/communitymedia.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/communitysupport.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class CovidFlipSection extends StatelessWidget {
  const CovidFlipSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveFlutter.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.width(4)),
      child: Column(
        children: [
          /// ROW 1 (END)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _flipCard(
                r,
                () {
                  Navigator.push(
                    routeGlobalKey.currentContext!,
                    MaterialPageRoute(builder: (_) => CommunityMedia()),
                  );
                },
                frontImage: CommonImagePath.bubble,

                backText: "Media & Awards",
                cardSize: r.isTablet ? r.width(20) : r.width(30),
              ),
              SizedBox(width: r.width(5)),
              _flipCard(
                r,
                () {
                  Navigator.push(
                    routeGlobalKey.currentContext!,
                    MaterialPageRoute(builder: (_) => Childrenyouth()),
                  );
                },
                frontImage: CommonImagePath.bubble,
                backText: "Children & Youth",
                cardSize: r.isTablet ? r.width(26) : r.width(40),
              ),
            ],
          ),

          SizedBox(height: r.height(3)),

          /// ROW 2 (START)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _flipCard(
                r,
                () {
                  Navigator.push(
                    routeGlobalKey.currentContext!,
                    MaterialPageRoute(builder: (_) => Communitysupport()),
                  );
                },
                frontImage: CommonImagePath.bubble,
                backText: "Community Support",
                cardSize: r.isTablet ? r.width(18) : r.width(40),
              ),
              SizedBox(width: r.width(5)),
              _flipCard(
                r,
                () {
                  Navigator.push(
                    routeGlobalKey.currentContext!,
                    MaterialPageRoute(builder: (_) => Healthcare()),
                  );
                },
                frontImage: CommonImagePath.bubble,
                backText: "Health Capacity",
                cardSize: r.isTablet ? r.width(20) : r.width(30),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _flipCard(
    ResponsiveFlutter r,
    VoidCallback onTap, {
    required String frontImage,
    required String backText,
    required double cardSize,
  }) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _cardFront(cardSize, frontImage),
      back: _cardBack(cardSize, backText, onTap),
    );
  }

  Widget _cardFront(double size, String image) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
    );
  }

  Widget _cardBack(double size, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Customcolor.colorBlue,
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Customcolor.colorBlue, Customcolor.baby_blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(14),
        child: FormLabel(
          text: text,
          textAlignment: TextAlign.center,
          labelColor: Colors.white,
          fontSize: size * 0.12, // font proportional to size
          fontweight: FontWeight.w600,
        ),
      ),
    );
  }
}
