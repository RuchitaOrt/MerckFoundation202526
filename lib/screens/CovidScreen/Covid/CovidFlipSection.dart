import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class CovidFlipSection extends StatefulWidget {
  final List<dynamic> content;

  const CovidFlipSection({
    super.key,
    required this.content,
  });

  @override
  State<CovidFlipSection> createState() => _CovidFlipSectionState();
}

class _CovidFlipSectionState extends State<CovidFlipSection> {
  final List<FlipCardController> _controllers = [];

  int? _openedIndex;

  @override
  void initState() {
    super.initState();

    _controllers.addAll(
      List.generate(
        widget.content.length,
        (_) => FlipCardController(),
      ),
    );
  }

  void _handleFlip(int index) {
    /// close previous
    if (_openedIndex != null && _openedIndex != index) {
      _controllers[_openedIndex!].toggleCard();
    }

    /// update current
    _openedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveFlutter.of(context);

    if (widget.content.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.width(4)),
      child: Wrap(
        spacing: r.width(5),
        runSpacing: r.height(3),
        alignment: WrapAlignment.center,
        children: List.generate(widget.content.length, (index) {
          final item = widget.content[index];

          return _flipCard(
            r,
            index,
            frontImage: item['thumbnail'] ?? "",
            backText: item['title'] ?? "",
            menuID: item['id'].toString() ?? "",
            cardSize: r.isTablet ? r.width(22) : r.width(36),
          );
        }),
      ),
    );
  }

  Widget _flipCard(
    ResponsiveFlutter r,
    int index, {
    required String frontImage,
    required String backText,
     required String menuID,
    required double cardSize,
  }) {
    return GestureDetector(
      onTap: () {
        _handleFlip(index);
        _controllers[index].toggleCard();
      },
      child: FlipCard(
        controller: _controllers[index],
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        front: _cardFront(cardSize, frontImage),
        back: _cardBack(cardSize, backText,menuID),
      ),
    );
  }

  Widget _cardFront(double size, String image) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(color: Colors.grey.shade300);
          },
        ),
      ),
    );
  }

  Widget _cardBack(double size, String text,String menuID) {
    return GestureDetector(
      onTap: ()
      {
          AppNavigation.navigateByMenuId(
    context,
    menuId: menuID,
    title:  text,
  
    
  
  );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Customcolor.colorBlue,
              Customcolor.babyBlue,
            ],
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(14),
        child: FormLabel(
          text: text,
          textAlignment: TextAlign.center,
          labelColor: Colors.white,
          fontSize: size * 0.09,
          fontweight: FontWeight.w600,
        ),
      ),
    );
  }
}