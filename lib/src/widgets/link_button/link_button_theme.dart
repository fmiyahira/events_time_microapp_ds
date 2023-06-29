// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSLinkButtonStyle { MILKED }

enum DSLinkButtonSize { MINIMAL, SMALL }

class DSLinkButtonTheme {
  final Color? color;
  final Color? textColor;
  final Color? disabledTextColor;
  final double? minHeight;
  final double? minWidth;
  final AlignmentDirectional? linkTextAlignment;
  final TextDecoration? textDecoration;

  DSLinkButtonTheme({
    this.color,
    this.textColor,
    this.disabledTextColor,
    this.minHeight,
    this.minWidth,
    this.linkTextAlignment,
    this.textDecoration,
  });

  DSLinkButtonTheme copyWithOverride(DSLinkButtonTheme? themeOverride) {
    return DSLinkButtonTheme(
      color: themeOverride?.color ?? color,
      textColor: themeOverride?.textColor ?? textColor,
      disabledTextColor: themeOverride?.disabledTextColor ?? disabledTextColor,
      minHeight: themeOverride?.minHeight ?? minHeight,
      minWidth: themeOverride?.minWidth ?? minWidth,
      linkTextAlignment: themeOverride?.linkTextAlignment ?? linkTextAlignment,
      textDecoration: themeOverride?.textDecoration ?? textDecoration,
    );
  }
}

final DSLinkButtonTheme linkButtonThemeDefault = DSLinkButtonTheme(
  color: Colors.transparent,
  textColor: DSColors.primary.base,
  disabledTextColor: DSColors.neutral.s72,
  minHeight: 56,
  minWidth: double.infinity,
  linkTextAlignment: AlignmentDirectional.center,
);

final DSLinkButtonTheme linkButtonThemeStyleMilked = DSLinkButtonTheme(
  textColor: DSColors.neutral.s100,
  disabledTextColor: DSColors.primary.light,
);

final DSLinkButtonTheme linkButtonThemeSizeSmall = DSLinkButtonTheme(
  minHeight: 44,
);

final DSLinkButtonTheme linkButtonThemeSizeMinimal = DSLinkButtonTheme(
  linkTextAlignment: AlignmentDirectional.centerStart,
);
