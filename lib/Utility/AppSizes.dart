import 'package:flutter/material.dart';

class AppSizes {
  static double heading(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.055;

  static double subHeading(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.030;

  static double body(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.035;

  static double caption(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.020;
}