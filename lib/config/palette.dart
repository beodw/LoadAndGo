import 'package:flutter/material.dart';

/// Colors definitions
Color primaryColor = Colors.white.withOpacity(0.75);
Color secondaryColor = Colors.cyan;
Color onHoverColor = Colors.grey.withOpacity(0.5);
Color sideBarButtonSelectedColor = Colors.grey.withOpacity(0.25);
Color transparent = Colors.transparent;
Color iconPrimaryColor = Colors.black.withOpacity(0.5);
Color iconSecondaryColor = Colors.black;

/// Utils

/// Icon Sizes
const double defaultIconSize2Xl = 40.0;
const double defaultIconSizeXl = 30.0;
const double defaultIconSizeLg = 20.0;
const double defaultIconSizeMd = 10.0;
const double defaultIconSizeSm = 5.0;

/// BorderRadii
const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(20));

///App theme
final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
);
