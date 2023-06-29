// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSSwitcherStyle { MILKED }

class DSSwitcherTheme {
  final Color? baseOffColor;
  final Color? baseOnColor;
  final Color? pullerColor;
  final BorderRadius? baseBorderRadius;
  final double? pullerHeight;
  final double? pullerWidth;
  final double? baseWidth;
  final double? baseHeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingText;

  DSSwitcherTheme({
    this.baseOffColor,
    this.baseOnColor,
    this.pullerColor,
    this.baseBorderRadius,
    this.pullerHeight,
    this.pullerWidth,
    this.baseWidth,
    this.baseHeight,
    this.padding,
    this.paddingText,
  });

  DSSwitcherTheme copyWithOverride(DSSwitcherTheme? themeOverride) {
    return DSSwitcherTheme(
      baseOffColor: themeOverride?.baseOffColor ?? baseOffColor,
      baseOnColor: themeOverride?.baseOnColor ?? baseOnColor,
      pullerColor: themeOverride?.pullerColor ?? pullerColor,
      baseBorderRadius: themeOverride?.baseBorderRadius ?? baseBorderRadius,
      pullerHeight: themeOverride?.pullerHeight ?? pullerHeight,
      pullerWidth: themeOverride?.pullerWidth ?? pullerWidth,
      baseWidth: themeOverride?.baseWidth ?? baseWidth,
      baseHeight: themeOverride?.baseHeight ?? baseHeight,
      padding: themeOverride?.padding ?? padding,
      paddingText: themeOverride?.paddingText ?? paddingText,
    );
  }
}

final DSSwitcherTheme switcherThemeDefault = DSSwitcherTheme(
  baseOffColor: DSColors.neutral.s72,
  baseOnColor: DSColors.primary.base,
  pullerColor: DSColors.neutral.s100,
  baseBorderRadius: BorderRadius.circular(16.0),
  pullerHeight: 24.0,
  pullerWidth: 24.0,
  baseWidth: 56.0,
  baseHeight: 32.0,
  padding: const EdgeInsets.only(right: 4.0),
  paddingText: const EdgeInsets.only(right: 16.0),
);

final DSSwitcherTheme switcherThemeStyleMilked = DSSwitcherTheme(
  baseOnColor: DSColors.secondary.base,
);
