// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSFeedbackMessageStyle { MILKED }

enum DSFeedbackMessageSize { LARGE, SMALL }

class DSFeedbackMessageTheme {
  final Color? textColor;
  final double? imageHeight;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  DSFeedbackMessageTheme({
    this.textColor,
    this.imageHeight,
    this.iconColor,
    this.iconBackgroundColor,
  });

  DSFeedbackMessageTheme copyWithOverride(
      DSFeedbackMessageTheme? themeOverride) {
    return DSFeedbackMessageTheme(
      textColor: themeOverride?.textColor ?? textColor,
      imageHeight: themeOverride?.imageHeight ?? imageHeight,
      iconColor: themeOverride?.iconColor ?? iconColor,
      iconBackgroundColor:
          themeOverride?.iconBackgroundColor ?? iconBackgroundColor,
    );
  }
}

final DSFeedbackMessageTheme feedbackMessageThemeDefault =
    DSFeedbackMessageTheme(
  textColor: DSColors.neutral.s24,
  imageHeight: 120.0,
  iconColor: DSColors.neutral.s46,
  iconBackgroundColor: DSColors.neutral.s100,
);

final DSFeedbackMessageTheme feedbackMessageThemeStyleMilked =
    DSFeedbackMessageTheme(
  textColor: DSColors.neutral.s100,
);
