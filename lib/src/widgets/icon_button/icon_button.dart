// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'all.dart';

class DSIconButton extends StatelessWidget {
  late DSIconButtonTheme iconButtonTheme;

  DSIconButtonTheme? theme;
  final DSIconButtonStyle? style;
  final IconData icon;
  final VoidCallback? onPressed;

  DSIconButton({
    super.key,
    this.theme,
    this.style,
    required this.icon,
    required this.onPressed,
  });

  DSIconButtonTheme? get themeFromStyle {
    if (style == null) return null;

    switch (style!) {
      case DSIconButtonStyle.MILKED:
        return iconButtonThemeStyleMilked;
    }
  }

  @override
  Widget build(BuildContext context) {
    iconButtonTheme = iconButtonThemeDefault;

    if (themeFromStyle != null) {
      iconButtonTheme = iconButtonTheme.copyWithOverride(themeFromStyle);
    }
    if (theme != null) {
      iconButtonTheme = iconButtonTheme.copyWithOverride(theme);
    }

    return SizedBox(
      height: iconButtonTheme.buttonSize,
      width: iconButtonTheme.buttonSize,
      child: IconButton(
        padding: EdgeInsets.all(iconButtonTheme.iconPadding!),
        icon: Icon(
          icon,
          color: iconButtonTheme.iconColor,
          size: iconButtonTheme.iconSize,
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        iconSize: iconButtonTheme.iconSize,
        onPressed: onPressed,
      ),
    );
  }
}
