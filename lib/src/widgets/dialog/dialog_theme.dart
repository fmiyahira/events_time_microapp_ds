// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSDialogType { ERROR, SUCCESS, WARNING, TIME, INFO }

class DSDialogTheme {
  final BorderRadiusGeometry? radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? iconBackgroundColor;
  final IconData? icon;
  final String? topImage;
  final Color? backgroundColor;
  final Color? iconColor;

  DSDialogTheme({
    this.radius,
    this.padding,
    this.margin,
    this.iconBackgroundColor,
    this.icon,
    this.topImage,
    this.backgroundColor,
    this.iconColor,
  });

  DSDialogTheme copyWithOverride(DSDialogTheme? themeOverride) {
    return DSDialogTheme(
      radius: themeOverride?.radius ?? radius,
      padding: themeOverride?.padding ?? padding,
      margin: themeOverride?.margin ?? margin,
      iconBackgroundColor:
          themeOverride?.iconBackgroundColor ?? iconBackgroundColor,
      icon: themeOverride?.icon ?? icon,
      topImage: themeOverride?.topImage ?? topImage,
      backgroundColor: themeOverride?.backgroundColor ?? backgroundColor,
      iconColor: themeOverride?.iconColor ?? iconColor,
    );
  }
}

final DSDialogTheme dialogThemeDefault = DSDialogTheme(
  radius: const BorderRadius.all(Radius.circular(16)),
  icon: Icons.cancel_outlined,
  iconBackgroundColor: DSColors.neutral.s96,
  backgroundColor: DSColors.neutral.s100,
  iconColor: DSColors.neutral.s24,
  margin: const EdgeInsets.symmetric(horizontal: kLayoutSpacerS),
  padding: const EdgeInsets.all(kLayoutSpacerXXL),
);

final DSDialogTheme dialogThemeTypeError = DSDialogTheme(
  icon: Icons.error,
  iconColor: DSColors.error.base,
  iconBackgroundColor: DSColors.error.lighter,
);

final DSDialogTheme dialogThemeTypeSuccess = DSDialogTheme(
  icon: Icons.check_circle_outline,
  iconColor: DSColors.success.base,
  iconBackgroundColor: DSColors.success.lighter,
);

final DSDialogTheme dialogThemeTypeWarning = DSDialogTheme(
  icon: Icons.warning,
  iconColor: DSColors.warning.base,
  iconBackgroundColor: DSColors.warning.lighter,
);

final DSDialogTheme dialogThemeTypeTime = DSDialogTheme(
  icon: Icons.access_time_filled_outlined,
  iconColor: DSColors.warning.base,
  iconBackgroundColor: DSColors.warning.lighter,
);

final DSDialogTheme dialogThemeTypeInfo = DSDialogTheme(
  icon: Icons.info_outline,
  iconColor: DSColors.primary.base,
  iconBackgroundColor: DSColors.primary.lighter,
);
