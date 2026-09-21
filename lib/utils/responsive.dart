import 'package:flutter/material.dart';

class Responsive {
  static const double designWidth = 373;
  static const double designHeight = 715;

  static double w(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return value * (screenWidth / designWidth);
  }

  static double h(BuildContext context, double value) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return value * (screenHeight / designHeight);
  }

  static double sp(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return value * (screenWidth / designWidth);
  }

  static double r(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return value * (screenWidth / designWidth);
  }

  static double icon(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return value * (screenWidth / designWidth);
  }
}