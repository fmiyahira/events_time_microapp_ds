// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSSelectStyle { MILKED }

enum DSSelectType { ICON, FILTER, BASE, CATEGORY }

class DSSelectTheme {
  final Color? iconColor;

  DSSelectTheme({
    this.iconColor,
  });

  DSSelectTheme copyWithOverride(DSSelectTheme? themeOverride) {
    return DSSelectTheme(
      iconColor: themeOverride?.iconColor ?? iconColor,
    );
  }
}

final DSSelectTheme selectThemeDefault = DSSelectTheme(
  iconColor: DSColors.neutral.s24,
);

final DSSelectTheme selectThemeStyleMilked = DSSelectTheme(
  iconColor: DSColors.neutral.s100,
);
