// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSCircleButtonStyle { MILKED }

enum DSCircleButtonSize { SMALL }

class DSCircleButtonTheme {
  final Color? buttonColor;
  final Color? iconColor;
  final Color? pressedButtonColor;
  final Color? pressedIconColor;
  final double? minHeight;
  final double? minWidth;
  final double? iconSize;

  DSCircleButtonTheme({
    this.buttonColor,
    this.iconColor,
    this.pressedButtonColor,
    this.pressedIconColor,
    this.minHeight,
    this.minWidth,
    this.iconSize,
  });

  DSCircleButtonTheme copyWithOverride(DSCircleButtonTheme? themeOverride) {
    return DSCircleButtonTheme(
      buttonColor: themeOverride?.buttonColor ?? buttonColor,
      iconColor: themeOverride?.iconColor ?? iconColor,
      pressedButtonColor:
          themeOverride?.pressedButtonColor ?? pressedButtonColor,
      pressedIconColor: themeOverride?.pressedIconColor ?? pressedIconColor,
      minHeight: themeOverride?.minHeight ?? minHeight,
      minWidth: themeOverride?.minWidth ?? minWidth,
      iconSize: themeOverride?.iconSize ?? iconSize,
    );
  }
}

const double _defaultButtonSize = 56;
const double _defaultIconSize = 24;
const double _smallButtonSize = 48;
const double _smallIconSize = 16;
const double _opacityPressedIconColor = 0.3;

DSCircleButtonTheme circleButtonThemeDefault = DSCircleButtonTheme(
  buttonColor: DSColors.primary.base,
  iconColor: DSColors.neutral.s100,
  pressedButtonColor: DSColors.primary.dark,
  pressedIconColor: DSColors.neutral.s100.withOpacity(_opacityPressedIconColor),
  minHeight: _defaultButtonSize,
  minWidth: _defaultButtonSize,
  iconSize: _defaultIconSize,
);

DSCircleButtonTheme circleButtonThemeStyleMilked = DSCircleButtonTheme(
  buttonColor: DSColors.neutral.s100,
  iconColor: DSColors.primary.base,
  pressedButtonColor:
      DSColors.neutral.s100.withOpacity(_opacityPressedIconColor),
  pressedIconColor: DSColors.primary.dark,
);

DSCircleButtonTheme circleButtonThemeSizeSmall = DSCircleButtonTheme(
  minHeight: _smallButtonSize,
  minWidth: _smallButtonSize,
  iconSize: _smallIconSize,
);
