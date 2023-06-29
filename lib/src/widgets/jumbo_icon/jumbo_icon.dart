// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'jumbo_icon_theme.dart';

class DSJumboIcon extends StatelessWidget {
  late DSJumboIconTheme jumboIconTheme;
  final DSJumboIconTheme? theme;
  final DSJumboIconStyle? style;
  final DSJumboIconSize? size;
  final DSJumboIconType? type;
  final IconData? icon;

  DSJumboIcon(
    this.icon, {
    super.key,
    this.theme,
    this.style,
    this.size,
    this.type,
  });

  DSJumboIconTheme? get themeFromSize {
    if (size == null) return null;

    switch (size!) {
      case DSJumboIconSize.LARGE:
        return jumboIconThemeSizeLarge;
      case DSJumboIconSize.SMALL:
        return jumboIconThemeSizeSmall;
    }
  }

  DSJumboIconTheme? get themeFromType {
    if (type == null) return null;

    switch (type!) {
      case DSJumboIconType.SUCCESS:
        return jumboIconThemeTypeSuccess;
      case DSJumboIconType.WARNING:
        return jumboIconThemeTypeWarning;
      case DSJumboIconType.ERROR:
        return jumboIconThemeTypeError;
      case DSJumboIconType.INFO:
        return jumboIconThemeTypeInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    jumboIconTheme = jumboIconThemeDefault;
    if (type != null) {
      jumboIconTheme = jumboIconTheme.copyWithOverride(themeFromType);
    }
    if (size != null) {
      jumboIconTheme = jumboIconTheme.copyWithOverride(themeFromSize);
    }
    if (theme != null) {
      jumboIconTheme = jumboIconTheme.copyWithOverride(theme);
    }

    return Container(
      alignment: Alignment.center,
      height: jumboIconTheme.backgroundSize,
      width: jumboIconTheme.backgroundSize,
      decoration: BoxDecoration(
        borderRadius: jumboIconTheme.radius,
        color: jumboIconTheme.backgroundColor,
      ),
      child: Icon(
        icon,
        color: jumboIconTheme.iconColor,
        size: jumboIconTheme.iconSize,
      ),
    );
  }
}
