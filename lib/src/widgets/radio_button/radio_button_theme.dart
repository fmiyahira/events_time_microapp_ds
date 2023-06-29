// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSRadioButtonStyle { MILKED }

class DSRadioButtonTheme {
  final Color? radioColor;
  final EdgeInsets? radioMargin;
  final Color? pinColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? inactiveColor;
  final Color? captionTextColor;
  final EdgeInsets? margin;

  DSRadioButtonTheme({
    this.radioColor,
    this.radioMargin,
    this.pinColor,
    this.textColor,
    this.borderColor,
    this.inactiveColor,
    this.captionTextColor,
    this.margin,
  });

  DSRadioButtonTheme copyWithOverride(DSRadioButtonTheme? themeOverride) {
    return DSRadioButtonTheme(
      radioColor: themeOverride?.radioColor ?? radioColor,
      radioMargin: themeOverride?.radioMargin ?? radioMargin,
      pinColor: themeOverride?.pinColor ?? pinColor,
      textColor: themeOverride?.textColor ?? textColor,
      borderColor: themeOverride?.borderColor ?? borderColor,
      inactiveColor: themeOverride?.inactiveColor ?? inactiveColor,
      captionTextColor: themeOverride?.captionTextColor ?? captionTextColor,
      margin: themeOverride?.margin ?? margin,
    );
  }
}

final DSRadioButtonTheme radioButtonThemeDefault = DSRadioButtonTheme(
  radioColor: DSColors.primary.base,
  radioMargin: const EdgeInsets.only(
    left: kComponentSpacerXXS,
    top: kComponentSpacerXS,
    right: kComponentSpacerM,
  ),
  inactiveColor: DSColors.neutral.s88,
  pinColor: Colors.transparent,
  borderColor: DSColors.neutral.s24,
  margin: const EdgeInsets.only(bottom: kComponentSpacerL),
);

final DSRadioButtonTheme radioButtonThemeStyleMilked = DSRadioButtonTheme(
  radioColor: DSColors.neutral.s100,
  inactiveColor: DSColors.neutral.s100.withOpacity(0.64),
  borderColor: DSColors.neutral.s100,
  textColor: DSColors.neutral.s100,
  captionTextColor: DSColors.neutral.s100.withOpacity(0.40),
);
