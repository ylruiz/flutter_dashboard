import 'package:flutter/material.dart';

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Consistent padding
  static const EdgeInsets screenPadding = EdgeInsets.all(md);
  static const EdgeInsets cardPadding = EdgeInsets.all(18.0);
  static const EdgeInsets smallPadding = EdgeInsets.all(sm);
}

class AppBorderRadius {
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double xl = 20.0;

  static BorderRadius get smallRadius => BorderRadius.circular(small);
  static BorderRadius get mediumRadius => BorderRadius.circular(medium);
  static BorderRadius get largeRadius => BorderRadius.circular(large);
  static BorderRadius get xlRadius => BorderRadius.circular(xl);
}

class AppShadows {
  static const Color shadowColor = Color(0x1A000000);

  static List<BoxShadow> smallShadow = [
    BoxShadow(
      color: shadowColor,
      blurRadius: 8,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: shadowColor,
      blurRadius: 12,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColor,
      blurRadius: 4,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];
}
