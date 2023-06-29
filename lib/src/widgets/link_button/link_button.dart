// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/widgets/interactive_text/interactive_text.dart';
import 'package:events_time_microapp_ds/src/widgets/interactive_text/interactive_text_theme.dart';
import 'package:flutter/material.dart';

class DSLinkButton extends StatelessWidget {
  late DSLinkButtonTheme linkButtonTheme;

  final DSLinkButtonTheme? theme;
  final DSLinkButtonStyle? style;
  final DSLinkButtonSize? size;
  final DSInteractiveTextType? textType;
  final String text;
  final Function()? onPressed;
  final Function()? onLongPressed;
  final bool enabled;

  DSLinkButton({
    super.key,
    this.theme,
    this.style,
    this.size,
    this.textType,
    required this.text,
    this.onPressed,
    this.onLongPressed,
    this.enabled = true,
  });

  DSLinkButtonTheme? get themeFromStyle {
    if (style == null) return null;

    switch (style!) {
      case DSLinkButtonStyle.MILKED:
        return linkButtonThemeStyleMilked;
    }
  }

  DSLinkButtonTheme? get themeFromSize {
    if (size == null) return null;

    switch (size!) {
      case DSLinkButtonSize.MINIMAL:
        return linkButtonThemeSizeMinimal;
      case DSLinkButtonSize.SMALL:
        return linkButtonThemeSizeSmall;
    }
  }

  bool get isMinimal => size == DSLinkButtonSize.MINIMAL;

  @override
  Widget build(BuildContext context) {
    linkButtonTheme = linkButtonThemeDefault;

    if (style != null) {
      linkButtonTheme = linkButtonTheme.copyWithOverride(themeFromStyle);
    }

    if (size != null) {
      linkButtonTheme = linkButtonTheme.copyWithOverride(themeFromSize);
    }

    if (theme != null) {
      linkButtonTheme = linkButtonTheme.copyWithOverride(theme);
    }

    return GestureDetector(
      onTap: enabled && onPressed != null ? onPressed : null,
      onLongPress: enabled && onLongPressed != null ? onLongPressed : null,
      child: Container(
        alignment: linkButtonTheme.linkTextAlignment,
        color: linkButtonTheme.color,
        width: isMinimal ? null : linkButtonTheme.minWidth,
        height: isMinimal ? null : linkButtonTheme.minHeight,
        child: DSInteractiveText(
          text: text,
          type: textType,
          theme: DSInteractiveTextTheme(
            textColor: enabled
                ? linkButtonTheme.textColor
                : linkButtonTheme.disabledTextColor,
            textDecoration: linkButtonTheme.textDecoration,
          ),
        ),
      ),
    );
  }
}
