// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSNavListItemElementStyle { MILKED }

class DSNavListItemElementTheme {
  final DSTextStyle? titleStyle;
  final Color? captionColor;
  final Color? borderColor;
  final Color? selectedColor;
  final double? borderWidth;
  final double? paddingVertical;
  final double paddingLeftElement;
  final AlignmentGeometry? alignment;

  DSNavListItemElementTheme({
    this.titleStyle,
    this.captionColor,
    this.borderColor,
    this.selectedColor,
    this.borderWidth,
    this.paddingVertical,
    required this.paddingLeftElement,
    this.alignment,
  });

  DSNavListItemElementTheme copyWithOverride(
      DSNavListItemElementTheme? themeOverride) {
    return DSNavListItemElementTheme(
      titleStyle: themeOverride?.titleStyle ?? titleStyle,
      captionColor: themeOverride?.captionColor ?? captionColor,
      borderColor: themeOverride?.borderColor ?? borderColor,
      selectedColor: themeOverride?.selectedColor ?? selectedColor,
      borderWidth: themeOverride?.borderWidth ?? borderWidth,
      paddingVertical: themeOverride?.paddingVertical ?? paddingVertical,
      paddingLeftElement:
          themeOverride?.paddingLeftElement ?? paddingLeftElement,
      alignment: themeOverride?.alignment ?? alignment,
    );
  }
}

final DSNavListItemElementTheme navListItemElementThemeDefault =
    DSNavListItemElementTheme(
  captionColor: DSColors.neutral.s100,
  borderColor: DSColors.neutral.s88,
  selectedColor: DSColors.primary.base,
  alignment: AlignmentDirectional.centerStart,
  borderWidth: 1.0,
  paddingVertical: 24.0,
  paddingLeftElement: 0,
);

final DSNavListItemElementTheme navListItemElementThemeStyleMilked =
    DSNavListItemElementTheme(
  titleStyle: DSTextStyle.MILKED,
  captionColor: DSColors.neutral.s46,
  borderColor: DSColors.neutral.s88,
  paddingLeftElement: 0,
);
