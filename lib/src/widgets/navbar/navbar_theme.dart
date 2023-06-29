// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/colors/all.dart';
import '../../common/constants/all.dart';

enum DSNavBarStyle { MILKED }

class DSNavBarTheme {
  final Color? backgroundColor;
  final Brightness? brightness;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  DSNavBarTheme({
    this.backgroundColor,
    this.brightness,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
  });

  DSNavBarTheme copyWithOverride(DSNavBarTheme? themeOverride) {
    return DSNavBarTheme(
      backgroundColor: themeOverride?.backgroundColor ?? backgroundColor,
      brightness: themeOverride?.brightness ?? brightness,
      paddingTop: themeOverride?.paddingTop ?? paddingTop,
      paddingBottom: themeOverride?.paddingBottom ?? paddingBottom,
      paddingLeft: themeOverride?.paddingLeft ?? paddingLeft,
      paddingRight: themeOverride?.paddingRight ?? paddingRight,
    );
  }
}

final DSNavBarTheme navBarThemeDefault = DSNavBarTheme(
  backgroundColor: DSColors.neutral.s100,
  brightness: Brightness.light,
  paddingTop: kLayoutSpacerXS,
  paddingBottom: kLayoutSpacerXS,
  paddingLeft: kLayoutSpacerS,
  paddingRight: kLayoutSpacerS,
);

final DSNavBarTheme navBarThemeStyleMilked = DSNavBarTheme(
  backgroundColor: DSColors.primary.base,
  brightness: Brightness.dark,
);
