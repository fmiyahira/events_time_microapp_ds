import 'package:events_time_microapp_ds/src/common/text_font_factor_calculator.dart';
import 'package:events_time_microapp_ds/src/widgets/interactive_text/interactive_text_theme.dart';
import 'package:flutter/material.dart';

class DSInteractiveText extends StatefulWidget {
  final DSInteractiveTextStyle? style;
  final DSInteractiveTextType type;
  final DSInteractiveTextTheme? theme;
  final String text;
  final Color? color;
  final bool enabled;

  const DSInteractiveText({
    super.key,
    this.theme,
    this.style,
    required this.type,
    required this.text,
    this.color,
    this.enabled = true,
  });

  @override
  State<DSInteractiveText> createState() => _DSInteractiveTextState();
}

class _DSInteractiveTextState extends State<DSInteractiveText> {
  late DSInteractiveTextTheme theme;

  @override
  void initState() {
    super.initState();

    theme = interactiveTextThemeDefault.copyWithOverride(
        widget.theme ?? themeFromType.copyWithOverride(themeFromStyle));
  }

  @override
  void didUpdateWidget(DSInteractiveText oldWidget) {
    super.didUpdateWidget(oldWidget);

    theme = interactiveTextThemeDefault.copyWithOverride(
        widget.theme ?? themeFromType.copyWithOverride(themeFromStyle));
  }

  DSInteractiveTextTheme? get themeFromStyle {
    if (widget.style == DSInteractiveTextStyle.MILKED) {
      return interactiveTextThemeMilked;
    }

    return null;
  }

  DSInteractiveTextTheme get themeFromType {
    switch (widget.type) {
      case DSInteractiveTextType.ACTION:
        return interactiveTextThemeAction;
      case DSInteractiveTextType.ACTION_SMALL:
        return interactiveTextThemeActionSmall;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: theme.textAlign,
      textScaleFactor: TextFontScaleCalculator.call(theme.fontSize!, context),
      style: TextStyle(
        color: widget.color ??
            (widget.enabled ? theme.textColor : theme.disabledTextColor),
        fontSize: theme.fontSize,
        fontStyle: theme.fontStyle,
        fontWeight: theme.fontWeight,
        height: theme.lineHeight,
        letterSpacing: theme.letterSpacing,
        decoration: theme.textDecoration,
      ),
    );
  }
}
