// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSNavListItemChevronStyle { MILKED }

class DSNavListItemChevronTheme {
  final EdgeInsets? padding;
  final double? borderWidth;
  final Color? borderColor;
  final Color? titleColor;
  final Color? captionColor;
  final double? leadingSize;
  final Color? leadingColor;
  final double? trailingSize;
  final Color? trailingColor;
  DSNavListItemChevronTheme({
    this.padding,
    this.borderWidth,
    this.borderColor,
    this.titleColor,
    this.captionColor,
    this.leadingSize,
    this.leadingColor,
    this.trailingSize,
    this.trailingColor,
  });

  DSNavListItemChevronTheme copyWithOverride(
      DSNavListItemChevronTheme? themeOverride) {
    return DSNavListItemChevronTheme(
      padding: themeOverride?.padding ?? padding,
      borderWidth: themeOverride?.borderWidth ?? borderWidth,
      borderColor: themeOverride?.borderColor ?? borderColor,
      titleColor: themeOverride?.titleColor ?? titleColor,
      captionColor: themeOverride?.captionColor ?? captionColor,
      leadingSize: themeOverride?.leadingSize ?? leadingSize,
      leadingColor: themeOverride?.leadingColor ?? leadingColor,
      trailingSize: themeOverride?.trailingSize ?? trailingSize,
      trailingColor: themeOverride?.trailingColor ?? trailingColor,
    );
  }
}

final DSNavListItemChevronTheme navListItemChevronThemeDefault =
    DSNavListItemChevronTheme(
  padding: const EdgeInsets.symmetric(
    vertical: 24,
  ),
  borderWidth: 1.0,
  borderColor: DSColors.neutral.s88,
  captionColor: DSColors.neutral.s46,
  leadingSize: 24,
  leadingColor: DSColors.neutral.s46,
  trailingSize: 16,
  trailingColor: DSColors.neutral.s46,
);
final DSNavListItemChevronTheme navListItemChevronThemeStyleMilked =
    DSNavListItemChevronTheme(
  borderColor: DSColors.neutral.s88,
  titleColor: DSColors.neutral.s100,
  captionColor: DSColors.neutral.s100.withOpacity(0.64),
  leadingColor: DSColors.neutral.s100,
  trailingColor: DSColors.neutral.s100,
);
