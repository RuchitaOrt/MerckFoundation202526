import 'package:flutter/material.dart';

class ResponsiveFlutter {
  final BuildContext context;
  final double _screenWidth;
  final double _screenHeight;
  final double _textScaleFactor;

  ResponsiveFlutter._(this.context)
      : _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height,
        _textScaleFactor = MediaQuery.of(context).textScaleFactor;

  static ResponsiveFlutter of(BuildContext context) {
    return ResponsiveFlutter._(context);
  }

  bool get isTablet => _screenWidth >= 600;

  double width(double percent) => _screenWidth * percent / 100;
  double height(double percent) => _screenHeight * percent / 100;

  double fontSize(double percent) {
    final base = (_screenWidth + _screenHeight) / 2;
    return (base * percent / 100) / _textScaleFactor;
  }
}

extension SizeBox on double {
  SizedBox get widthBox {
    return SizedBox(
      width: this,
    );
  }

  SizedBox get heightBox {
    return SizedBox(
      height: this,
    );
  }
}
