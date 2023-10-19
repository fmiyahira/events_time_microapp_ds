// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/src/common/colors/all.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/constants/all.dart';

enum DSTextType {
  HERO,
  HEADING1,
  HEADING2,
  HEADING3,
  HEADING4,
  BODY,
  BODY_SMALL,
  BODY_SMALLER,
  BODY_CAPTION,
  INPUT,
  LABEL,
  LABEL_SMALL,
  NUMBER,
  NUMBER_SMALL,
  NUMBER_SMALLER,
}

enum DSTextStyle { SUCCESS, WARNING, ERROR, INFO, MILKED }

class DSTextTheme {
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? lineHeight;
  final double? letterSpacing;
  final Color? textColor;
  final double? textColorOpacity;
  final Color? inactiveTextColor;
  final Color? disabledTextColor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  const DSTextTheme({
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.lineHeight,
    this.letterSpacing,
    this.textColor,
    this.textColorOpacity,
    this.inactiveTextColor,
    this.disabledTextColor,
    this.textAlign,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
  });

  DSTextTheme copyWithOverride(DSTextTheme? textThemeOverride) {
    return DSTextTheme(
      fontFamily: textThemeOverride?.fontFamily ?? fontFamily,
      fontSize: textThemeOverride?.fontSize ?? fontSize,
      fontWeight: textThemeOverride?.fontWeight ?? fontWeight,
      fontStyle: textThemeOverride?.fontStyle ?? fontStyle,
      lineHeight: textThemeOverride?.lineHeight ?? lineHeight,
      letterSpacing: textThemeOverride?.letterSpacing ?? letterSpacing,
      textColor: textThemeOverride?.textColor ?? textColor,
      textColorOpacity: textThemeOverride?.textColorOpacity ?? textColorOpacity,
      inactiveTextColor:
          textThemeOverride?.inactiveTextColor ?? inactiveTextColor,
      disabledTextColor:
          textThemeOverride?.disabledTextColor ?? disabledTextColor,
      textAlign: textThemeOverride?.textAlign ?? textAlign,
      decoration: textThemeOverride?.decoration ?? decoration,
      decorationColor: textThemeOverride?.decorationColor ?? decorationColor,
      decorationStyle: textThemeOverride?.decorationStyle ?? decorationStyle,
      decorationThickness:
          textThemeOverride?.decorationThickness ?? decorationThickness,
    );
  }
}

class DSTextSpan {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  final GestureRecognizer? recognizer;
  final DSTextTheme? theme;

  DSTextSpan(
    this.text, {
    this.fontWeight,
    this.color,
    this.decoration,
    this.recognizer,
    this.theme,
  });
}

final DSTextTheme textThemeDefault = DSTextTheme(
  fontFamily: kFontName,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  textColor: DSColors.neutral.s24,
  textColorOpacity: 1,
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
  textAlign: TextAlign.start,
);

final DSTextTheme textThemeStyleSuccess = DSTextTheme(
  textColor: DSColors.success.base,
);
final DSTextTheme textThemeStyleWarning = DSTextTheme(
  textColor: DSColors.warning.base,
);
final DSTextTheme textThemeStyleError = DSTextTheme(
  textColor: DSColors.error.base,
);
final DSTextTheme textThemeStyleMilked = DSTextTheme(
  textColor: DSColors.neutral.s100,
);
final DSTextTheme textThemeStyleInfo = DSTextTheme(
  textColor: DSColors.primary.base,
);

const DSTextTheme textThemeTypeHero = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 44,
  lineHeight: 1.454,
  letterSpacing: -1.4,
);
const DSTextTheme textThemeTypeHeading1 = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 32,
  lineHeight: 1.25,
  letterSpacing: -1.4,
);
const DSTextTheme textThemeTypeHeading2 = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 24,
  lineHeight: 1.333,
  letterSpacing: -0.6,
);
const DSTextTheme textThemeTypeHeading3 = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  lineHeight: 1.3,
  letterSpacing: -0.56,
);
const DSTextTheme textThemeTypeHeading4 = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
);
const DSTextTheme textThemeTypeBody = DSTextTheme(
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
);
const DSTextTheme textThemeTypeBodySmall = DSTextTheme(
  fontSize: 14,
  lineHeight: 1.429,
  letterSpacing: -0.20,
);
const DSTextTheme textThemeTypeBodySmaller = DSTextTheme(
  fontSize: 12,
  lineHeight: 1.429,
  letterSpacing: 0,
);
final DSTextTheme textThemeTypeBodyCaption = DSTextTheme(
  textColor: DSColors.neutral.s46,
  fontSize: 14,
  lineHeight: 1.429,
  letterSpacing: -0.20,
);
const DSTextTheme textThemeTypeInput = DSTextTheme(
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
);
const DSTextTheme textThemeTypeLabel = DSTextTheme(
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
);
const DSTextTheme textThemeTypeLabelSmall = DSTextTheme(
  fontSize: 14,
  lineHeight: 1.142,
  letterSpacing: 0,
);
const DSTextTheme textThemeTypeNumber = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
);
const DSTextTheme textThemeTypeNumberSmall = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  lineHeight: 1.428,
  letterSpacing: -0.2,
);
const DSTextTheme textThemeTypeNumberSmaller = DSTextTheme(
  fontWeight: FontWeight.bold,
  fontSize: 12,
  lineHeight: 1.428,
  letterSpacing: -0.2,
);
