// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSIconButtonStyle { MILKED }

class DSIconButtonTheme {
  final Color? iconColor;
  final double? buttonSize;
  final double? iconSize;
  final double? iconPadding;
  final AlignmentGeometry? alignment;

  DSIconButtonTheme({
    this.iconColor,
    this.buttonSize,
    this.iconSize,
    this.iconPadding,
    this.alignment,
  });

  DSIconButtonTheme copyWithOverride(DSIconButtonTheme? themeOverride) {
    return DSIconButtonTheme(
      iconColor: themeOverride?.iconColor ?? iconColor,
      buttonSize: themeOverride?.buttonSize ?? buttonSize,
      iconSize: themeOverride?.iconSize ?? iconSize,
      iconPadding: themeOverride?.iconPadding ?? iconPadding,
      alignment: themeOverride?.alignment ?? alignment,
    );
  }
}

final DSIconButtonTheme iconButtonThemeDefault = DSIconButtonTheme(
  iconColor: DSColors.neutral.s24,
  buttonSize: 32.0,
  iconSize: 24.0,
  iconPadding: (32.0 - 24.0) / 2,
  alignment: Alignment.center,
);

final DSIconButtonTheme iconButtonThemeStyleMilked = DSIconButtonTheme(
  iconColor: DSColors.neutral.s100,
);
