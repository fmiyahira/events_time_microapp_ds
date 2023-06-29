// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/colors/all.dart';

enum DSDividerStyle { MILKED }

enum DSDividerSize { LARGE, EXTRA_LARGE }

class DSDividerTheme {
  final Color? color;
  final double? height;

  DSDividerTheme({
    this.color,
    this.height,
  });

  DSDividerTheme copyWithOverride(DSDividerTheme? dividerThemeOverride) {
    return DSDividerTheme(
      color: dividerThemeOverride?.color ?? color,
      height: dividerThemeOverride?.height ?? height,
    );
  }
}

final DSDividerTheme dividerThemeDefault = DSDividerTheme(
  color: DSColors.neutral.s88,
  height: 1.0,
);

final DSDividerTheme dividerThemeStyleMilked = DSDividerTheme(
  color: DSColors.neutral.s100.withOpacity(0.76),
);

final DSDividerTheme dividerThemeSizeLarge = DSDividerTheme(
  color: DSColors.neutral.s96,
  height: 4.0,
);

final DSDividerTheme dividerThemeSizeExtraLarge = DSDividerTheme(
  color: DSColors.neutral.s96,
  height: 8.0,
);
