// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSConfirmDialogTheme {
  final BorderRadiusGeometry? radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? iconBackgroundColor;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? topImage;

  DSConfirmDialogTheme({
    this.radius,
    this.margin,
    this.padding,
    this.iconBackgroundColor,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.topImage,
  });

  DSConfirmDialogTheme copyWithOverride(DSConfirmDialogTheme? themeOverride) {
    return DSConfirmDialogTheme(
      radius: themeOverride?.radius ?? radius,
      margin: themeOverride?.margin ?? margin,
      padding: themeOverride?.padding ?? padding,
      iconBackgroundColor:
          themeOverride?.iconBackgroundColor ?? iconBackgroundColor,
      icon: themeOverride?.icon ?? icon,
      backgroundColor: themeOverride?.backgroundColor ?? backgroundColor,
      iconColor: themeOverride?.iconColor ?? iconColor,
      topImage: themeOverride?.topImage ?? topImage,
    );
  }
}

final DSConfirmDialogTheme confirmDialogThemeDefault = DSConfirmDialogTheme(
  radius: const BorderRadius.all(Radius.circular(16)),
  icon: Icons.close,
  iconBackgroundColor: DSColors.error.base,
  backgroundColor: DSColors.neutral.s100,
  iconColor: DSColors.neutral.s100,
  margin: const EdgeInsets.symmetric(horizontal: kLayoutSpacerS),
  padding: const EdgeInsets.all(kComponentSpacerXXL),
);

final DSConfirmDialogTheme confirmDialogThemeTypeError = DSConfirmDialogTheme(
  icon: Icons.error_outline,
  iconColor: DSColors.error.base,
  iconBackgroundColor: DSColors.error.lighter,
);

final DSConfirmDialogTheme confirmDialogThemeTypeSuccess = DSConfirmDialogTheme(
  icon: Icons.check_circle_outline,
  iconColor: DSColors.success.base,
  iconBackgroundColor: DSColors.success.lighter,
);

final DSConfirmDialogTheme confirmDialogThemeTypeWarning = DSConfirmDialogTheme(
  icon: Icons.warning,
  iconColor: DSColors.warning.base,
  iconBackgroundColor: DSColors.warning.lighter,
);

final DSConfirmDialogTheme confirmDialogThemeTypeTime = DSConfirmDialogTheme(
  icon: Icons.access_time_filled_outlined,
  iconColor: DSColors.warning.base,
  iconBackgroundColor: DSColors.warning.lighter,
);

final DSConfirmDialogTheme confirmDialogThemeTypeInfo = DSConfirmDialogTheme(
  icon: Icons.info_outline,
  iconColor: DSColors.primary.base,
  iconBackgroundColor: DSColors.primary.lighter,
);
