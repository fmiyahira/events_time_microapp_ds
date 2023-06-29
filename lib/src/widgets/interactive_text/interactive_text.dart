// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/src/common/text_font_factor_calculator.dart';
import 'package:events_time_microapp_ds/src/widgets/interactive_text/interactive_text_theme.dart';
import 'package:flutter/material.dart';

class DSInteractiveText extends StatelessWidget {
  late DSInteractiveTextTheme interactiveTextTheme;
  final DSInteractiveTextTheme? theme;
  final DSInteractiveTextStyle? style;
  final DSInteractiveTextType? type;
  final String text;
  final Color? color;
  final bool enabled;

  DSInteractiveText({
    super.key,
    this.theme,
    this.style,
    this.type,
    required this.text,
    this.color,
    this.enabled = true,
  });

  DSInteractiveTextTheme? get themeFromStyle {
    if (style == DSInteractiveTextStyle.MILKED) {
      return interactiveTextThemeMilked;
    }

    return null;
  }

  DSInteractiveTextTheme? get themeFromType {
    if (type == null) return null;

    switch (type!) {
      case DSInteractiveTextType.ACTION:
        return interactiveTextThemeAction;
      case DSInteractiveTextType.ACTION_SMALL:
        return interactiveTextThemeActionSmall;
    }
  }

  @override
  Widget build(BuildContext context) {
    interactiveTextTheme = interactiveTextThemeDefault;

    if (type != null) {
      interactiveTextTheme =
          interactiveTextTheme.copyWithOverride(themeFromType);
    }

    if (style != null) {
      interactiveTextTheme =
          interactiveTextTheme.copyWithOverride(themeFromStyle);
    }

    if (theme != null) {
      interactiveTextTheme = interactiveTextTheme.copyWithOverride(theme);
    }

    return Text(
      text,
      textAlign: interactiveTextTheme.textAlign,
      textScaleFactor:
          TextFontScaleCalculator.call(interactiveTextTheme.fontSize!, context),
      style: TextStyle(
        color: color ??
            (enabled
                ? interactiveTextTheme.textColor
                : interactiveTextTheme.disabledTextColor),
        fontSize: interactiveTextTheme.fontSize,
        fontStyle: interactiveTextTheme.fontStyle,
        fontWeight: interactiveTextTheme.fontWeight,
        height: interactiveTextTheme.lineHeight,
        letterSpacing: interactiveTextTheme.letterSpacing,
        decoration: interactiveTextTheme.textDecoration,
      ),
    );
  }
}
