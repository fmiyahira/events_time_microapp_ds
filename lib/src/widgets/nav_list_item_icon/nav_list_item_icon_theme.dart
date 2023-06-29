// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSNavListItemIconStyle { MILKED }

class DSNavListItemIconTheme {
  final DSTextStyle? titleStyle;
  final DSTextStyle? captionStyle;
  final Color? captionColor;
  final Color? borderColor;
  final Color? leadingColor;
  final double? borderWidth;
  final double? paddingVertical;
  final Color? titleColor;
  final Color? selectedColor;
  DSNavListItemIconTheme({
    this.titleStyle,
    this.captionStyle,
    this.captionColor,
    this.borderColor,
    this.leadingColor,
    this.borderWidth,
    this.paddingVertical,
    this.titleColor,
    this.selectedColor,
  });

  DSNavListItemIconTheme copyWithOverride(
      DSNavListItemIconTheme? themeOverride) {
    return DSNavListItemIconTheme(
      titleStyle: themeOverride?.titleStyle ?? titleStyle,
      captionStyle: themeOverride?.captionStyle ?? captionStyle,
      captionColor: themeOverride?.captionColor ?? captionColor,
      borderColor: themeOverride?.borderColor ?? borderColor,
      leadingColor: themeOverride?.leadingColor ?? leadingColor,
      borderWidth: themeOverride?.borderWidth ?? borderWidth,
      paddingVertical: themeOverride?.paddingVertical ?? paddingVertical,
      titleColor: themeOverride?.titleColor ?? titleColor,
      selectedColor: themeOverride?.selectedColor ?? selectedColor,
    );
  }
}

final DSNavListItemIconTheme navListItemIconThemeDefault =
    DSNavListItemIconTheme(
  captionColor: DSColors.neutral.s46,
  leadingColor: DSColors.primary.base,
  borderColor: DSColors.neutral.s88,
  selectedColor: DSColors.primary.base,
  borderWidth: 1.0,
  paddingVertical: 24.0,
);

final DSNavListItemIconTheme navListItemIconThemeStyleMilked =
    DSNavListItemIconTheme(
  titleStyle: DSTextStyle.MILKED,
  leadingColor: DSColors.neutral.s100,
  captionStyle: DSTextStyle.MILKED,
  captionColor: DSColors.neutral.s100,
  borderColor: DSColors.neutral.s88,
);
