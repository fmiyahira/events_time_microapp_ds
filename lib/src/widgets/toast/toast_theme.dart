// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSToastTheme {
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? padding;
  final double? minHeight;
  final double? opacity;
  final double? margin;
  final double? horizontalMargin;
  final double? buttonSize;
  final double? iconSize;
  final double? iconPadding;
  DSToastTheme({
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.minHeight,
    this.opacity,
    this.margin,
    this.horizontalMargin,
    this.buttonSize,
    this.iconSize,
    this.iconPadding,
  });

  DSToastTheme copyWithOverride(DSToastTheme? themeOverride) {
    return DSToastTheme(
      color: themeOverride?.color ?? color,
      textColor: themeOverride?.textColor ?? textColor,
      borderRadius: themeOverride?.borderRadius ?? borderRadius,
      padding: themeOverride?.padding ?? padding,
      minHeight: themeOverride?.minHeight ?? minHeight,
      opacity: themeOverride?.opacity ?? opacity,
      margin: themeOverride?.margin ?? margin,
      horizontalMargin: themeOverride?.horizontalMargin ?? horizontalMargin,
      buttonSize: themeOverride?.buttonSize ?? buttonSize,
      iconSize: themeOverride?.iconSize ?? iconSize,
      iconPadding: themeOverride?.iconPadding ?? iconPadding,
    );
  }
}

final DSToastTheme toastThemeDefault = DSToastTheme(
  color: DSColors.neutral.s24,
  textColor: DSColors.neutral.s100,
  borderRadius: kButtonBorderRadius,
  minHeight: kbuttonMinHeight,
  margin: kToastBottomMargin,
  horizontalMargin: kLayoutSpacerS,
  padding: kToastPadding,
  iconSize: 16.0,
  buttonSize: 20.0,
  iconPadding: 0.0,
);
