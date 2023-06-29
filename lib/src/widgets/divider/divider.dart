// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/src/widgets/divider/divider_theme.dart';
import 'package:flutter/material.dart';

class DSDivider extends StatelessWidget {
  late DSDividerTheme dividerTheme;
  final DSDividerStyle? style;
  final DSDividerTheme? theme;
  final DSDividerSize? size;

  DSDivider({
    super.key,
    this.style,
    this.theme,
    this.size,
  });

  DSDividerTheme? get themeFromSize {
    if (size == null) return null;

    switch (size!) {
      case DSDividerSize.LARGE:
        return dividerThemeSizeLarge;
      case DSDividerSize.EXTRA_LARGE:
        return dividerThemeSizeExtraLarge;
    }
  }

  DSDividerTheme? get themeFromStyle {
    if (style == null) return null;

    switch (style!) {
      case DSDividerStyle.MILKED:
        return dividerThemeStyleMilked;
    }
  }

  @override
  Widget build(BuildContext context) {
    dividerTheme = dividerThemeDefault;

    if (themeFromSize != null) {
      dividerTheme = dividerTheme.copyWithOverride(themeFromSize);
    }

    if (themeFromStyle != null) {
      dividerTheme = dividerTheme.copyWithOverride(themeFromStyle);
    }

    if (theme != null) {
      dividerTheme = dividerTheme.copyWithOverride(theme);
    }

    return Container(
      height: dividerTheme.height,
      width: double.infinity,
      color: dividerTheme.color,
    );
  }
}
