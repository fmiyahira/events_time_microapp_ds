// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSJumboIconStyle { MILKED }

enum DSJumboIconSize { SMALL, LARGE }

enum DSJumboIconType { SUCCESS, ERROR, WARNING, INFO }

class DSJumboIconTheme {
  final double? iconSize;
  final Color? iconColor;
  final double? backgroundSize;
  final Color? backgroundColor;
  final BorderRadius? radius;

  const DSJumboIconTheme({
    this.iconSize,
    this.iconColor,
    this.backgroundSize,
    this.backgroundColor,
    this.radius,
  });

  DSJumboIconTheme copyWithOverride(DSJumboIconTheme? themeOverride) {
    return DSJumboIconTheme(
      iconSize: themeOverride?.iconSize ?? iconSize,
      iconColor: themeOverride?.iconColor ?? iconColor,
      backgroundSize: themeOverride?.backgroundSize ?? backgroundSize,
      backgroundColor: themeOverride?.backgroundColor ?? backgroundColor,
      radius: themeOverride?.radius ?? radius,
    );
  }
}

final DSJumboIconTheme jumboIconThemeDefault = DSJumboIconTheme(
  radius: BorderRadius.circular(100.0),
  iconSize: 24.0,
  iconColor: DSColors.primary.base,
  backgroundSize: 48.0,
  backgroundColor: DSColors.primary.lighter,
);

const DSJumboIconTheme jumboIconThemeSizeSmall = DSJumboIconTheme(
  iconSize: 16.0,
  backgroundSize: 40.0,
);

const DSJumboIconTheme jumboIconThemeSizeLarge = DSJumboIconTheme(
  iconSize: 24.0,
  backgroundSize: 64.0,
);

final DSJumboIconTheme jumboIconThemeTypeSuccess = DSJumboIconTheme(
  iconColor: DSColors.success.darker,
  backgroundColor: DSColors.success.lighter,
);

final DSJumboIconTheme jumboIconThemeTypeError = DSJumboIconTheme(
  iconColor: DSColors.error.darker,
  backgroundColor: DSColors.error.lighter,
);

final DSJumboIconTheme jumboIconThemeTypeWarning = DSJumboIconTheme(
  iconColor: DSColors.warning.darker,
  backgroundColor: DSColors.warning.lighter,
);

final DSJumboIconTheme jumboIconThemeTypeInfo = DSJumboIconTheme(
  iconColor: DSColors.primary.darker,
  backgroundColor: DSColors.primary.lighter,
);
