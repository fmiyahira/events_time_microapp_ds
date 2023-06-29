// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/src/common/text_font_factor_calculator.dart';
import 'package:events_time_microapp_ds/src/widgets/text/text_theme.dart';
import 'package:flutter/material.dart';

class DSText extends StatelessWidget {
  late DSTextTheme textTheme;
  DSTextStyle? style;
  final DSTextType type;
  final DSTextTheme? theme;
  final Color? color;
  final String text;
  final List<DSTextSpan>? textSpan;
  final TextOverflow overflow;
  final int? maxLines;
  final TextWidthBasis textWidthBasis;
  final bool softWrap;
  final TextDirection? textDirection;

  DSText(
    this.text, {
    super.key,
    this.textSpan,
    required this.type,
    this.color,
    this.style,
    this.theme,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
  });

  DSTextTheme get themeFromType {
    switch (type) {
      case DSTextType.HERO:
        return textThemeTypeHero;
      case DSTextType.HEADING1:
        return textThemeTypeHeading1;
      case DSTextType.HEADING2:
        return textThemeTypeHeading2;
      case DSTextType.HEADING3:
        return textThemeTypeHeading3;
      case DSTextType.HEADING4:
        return textThemeTypeHeading4;
      case DSTextType.BODY:
        return textThemeTypeBody;
      case DSTextType.BODY_SMALL:
        return textThemeTypeBodySmall;
      case DSTextType.BODY_SMALLER:
        return textThemeTypeBodySmaller;
      case DSTextType.BODY_CAPTION:
        return textThemeTypeBodyCaption;
      case DSTextType.INPUT:
        return textThemeTypeInput;
      case DSTextType.LABEL:
        return textThemeTypeLabel;
      case DSTextType.LABEL_SMALL:
        return textThemeTypeLabelSmall;
      case DSTextType.NUMBER:
        return textThemeTypeNumber;
      case DSTextType.NUMBER_SMALL:
        return textThemeTypeNumberSmall;
    }
  }

  DSTextTheme? get themeFromStyle {
    if (style == null) return null;

    switch (style!) {
      case DSTextStyle.SUCCESS:
        return textThemeStyleSuccess;
      case DSTextStyle.WARNING:
        return textThemeStyleWarning;
      case DSTextStyle.ERROR:
        return textThemeStyleError;
      case DSTextStyle.INFO:
        return textThemeStyleInfo;
      case DSTextStyle.MILKED:
        return textThemeStyleMilked;
    }
  }

  @override
  Widget build(BuildContext context) {
    textTheme = textThemeDefault.copyWithOverride(themeFromType);

    if (style != null) {
      textTheme = textTheme.copyWithOverride(themeFromStyle);
    }

    if (theme != null) {
      textTheme = textTheme.copyWithOverride(theme);
    }

    final TextStyle effectiveTextStyle = TextStyle(
      color: color ??
          textTheme.textColor?.withOpacity(textTheme.textColorOpacity ?? 1.0),
      fontFamily: textTheme.fontFamily,
      fontSize: textTheme.fontSize,
      fontStyle: textTheme.fontStyle,
      fontWeight: textTheme.fontWeight,
      height: textTheme.lineHeight,
      letterSpacing: textTheme.letterSpacing,
      decoration: textTheme.decoration,
      decorationColor: textTheme.decorationColor,
      decorationStyle: textTheme.decorationStyle,
      decorationThickness: textTheme.decorationThickness,
    );

    return Text.rich(
      TextSpan(
        text: text,
        children: _buildTextSpan(effectiveTextStyle),
        style: effectiveTextStyle,
      ),
      textScaleFactor:
          TextFontScaleCalculator.call(textTheme.fontSize!, context),
      textAlign: textTheme.textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
    );
  }

  List<TextSpan> _buildTextSpan(TextStyle parentStyle) {
    return textSpan?.map((DSTextSpan e) {
          final TextStyle effectiveTextStyle = parentStyle.copyWith(
            color: e.color ??
                e.theme?.textColor
                    ?.withOpacity(e.theme?.textColorOpacity ?? 1.0),
            fontFamily: e.theme?.fontFamily,
            fontSize: e.theme?.fontSize,
            fontStyle: e.theme?.fontStyle,
            fontWeight: e.fontWeight ?? e.theme?.fontWeight,
            height: e.theme?.lineHeight,
            letterSpacing: e.theme?.letterSpacing,
            decoration: e.decoration ?? e.theme?.decoration,
            decorationColor: e.theme?.decorationColor,
            decorationStyle: e.theme?.decorationStyle,
            decorationThickness: e.theme?.decorationThickness,
          );

          return TextSpan(
            text: e.text,
            style: effectiveTextStyle,
            recognizer: e.recognizer,
          );
        }).toList() ??
        <TextSpan>[];
  }
}
