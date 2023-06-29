// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSCheckboxStyle { MILKED }

class DSCheckboxTheme {
  final Color? borderColor;
  final Color? textColor;
  final Color? captionColor;
  final double? size;
  final double? iconSize;
  final Color? iconColor;
  final Color? fillColor;
  final Color? disabledBorderColor;
  final Color? disabledTextColor;
  final Color? disabledCaptionColor;
  final Color? disabledIconColor;
  final Color? disabledFillColor;
  final Color? checkedBorderColor;
  final Color? checkedFillColor;

  const DSCheckboxTheme({
    this.borderColor,
    this.textColor,
    this.captionColor,
    this.size,
    this.iconSize,
    this.iconColor,
    this.fillColor,
    this.disabledBorderColor,
    this.disabledTextColor,
    this.disabledCaptionColor,
    this.disabledIconColor,
    this.disabledFillColor,
    this.checkedBorderColor,
    this.checkedFillColor,
  });

  DSCheckboxTheme copyWithOverride(DSCheckboxTheme? themeOverride) {
    return DSCheckboxTheme(
      borderColor: themeOverride?.borderColor ?? borderColor,
      textColor: themeOverride?.textColor ?? textColor,
      captionColor: themeOverride?.captionColor ?? captionColor,
      size: themeOverride?.size ?? size,
      iconSize: themeOverride?.iconSize ?? iconSize,
      iconColor: themeOverride?.iconColor ?? iconColor,
      fillColor: themeOverride?.fillColor ?? fillColor,
      disabledBorderColor:
          themeOverride?.disabledBorderColor ?? disabledBorderColor,
      disabledTextColor: themeOverride?.disabledTextColor ?? disabledTextColor,
      disabledCaptionColor:
          themeOverride?.disabledCaptionColor ?? disabledCaptionColor,
      disabledIconColor: themeOverride?.disabledIconColor ?? disabledIconColor,
      disabledFillColor: themeOverride?.disabledFillColor ?? disabledFillColor,
      checkedBorderColor:
          themeOverride?.checkedBorderColor ?? checkedBorderColor,
      checkedFillColor: themeOverride?.checkedFillColor ?? checkedFillColor,
    );
  }
}

final DSCheckboxTheme checkboxThemeDefault = DSCheckboxTheme(
  borderColor: DSColors.neutral.s24,
  size: 20.0,
  iconSize: 10.0,
  iconColor: DSColors.neutral.s100,
  fillColor: Colors.transparent,
  disabledBorderColor: DSColors.neutral.s96,
  disabledTextColor: DSColors.neutral.s72,
  disabledIconColor: DSColors.neutral.s72,
  disabledFillColor: DSColors.neutral.s96,
  checkedBorderColor: DSColors.primary.base,
  checkedFillColor: DSColors.primary.base,
);

final DSCheckboxTheme checkboxThemeStyleMilked = DSCheckboxTheme(
  textColor: DSColors.neutral.s100,
  captionColor: DSColors.neutral.s100.withOpacity(0.40),
  borderColor: DSColors.neutral.s100,
  iconColor: DSColors.primary.base,
  disabledBorderColor: DSColors.neutral.s100.withOpacity(0.64),
  disabledTextColor: DSColors.neutral.s100.withOpacity(0.64),
  disabledCaptionColor: DSColors.neutral.s100.withOpacity(0.64),
  disabledIconColor: DSColors.primary.base,
  disabledFillColor: DSColors.neutral.s100.withOpacity(0.64),
  checkedBorderColor: DSColors.neutral.s100,
  checkedFillColor: DSColors.neutral.s100,
);
