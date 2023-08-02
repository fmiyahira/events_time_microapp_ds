import 'package:events_time_microapp_ds/src/common/colors/color_scale.dart';
import 'package:events_time_microapp_ds/src/common/colors/palette.dart';
import 'package:flutter/material.dart';

DSPalette defaultPalette = DSPalette(
  primary: const DSColorScale(
    darker: Color(0xFF85230c),
    dark: Color(0xFFffb4a3),
    base: Color(0xFFFC795B),
    light: Color(0xFFa63a22),
    lighter: Color(0xFFffdad2),
  ),
  secondary: const DSColorScale(
    darker: Color(0xFF005228),
    dark: Color(0xFF80d998),
    base: Color(0xFF8FD7A0),
    light: Color(0xFF006d38),
    lighter: Color(0xFF9bf6b2),
  ),
  tertiary: const DSColorScale(
    darker: Color(0xFFB11B50),
    dark: Color(0xFFDD2264),
    base: Color(0xFFE44E83),
    light: Color(0xFFF7CADA),
    lighter: Color(0xFFFCEDF3),
  ),
  error: const DSColorScale(
    darker: Color(0xFF6E0C19),
    dark: Color(0xFFA51226),
    base: Color(0xFFDC1832),
    light: Color(0xFFF9C8CE),
    lighter: Color(0xFFFDEDEF),
  ),
  success: const DSColorScale(
    darker: Color(0xFF1B5F1B),
    dark: Color(0xFF288F28),
    base: Color(0xFF36BF36),
    light: Color(0xFFCFF2CF),
    lighter: Color(0xFFEFFBEF),
  ),
  warning: const DSColorScale(
    darker: Color(0xFF7A3100),
    dark: Color(0xFFB84900),
    base: Color(0xFFFF6600),
    light: Color(0xFFFFDAC2),
    lighter: Color(0xFFFFF3EB),
  ),
  chart01: const DSColorScale(
    darker: Color(0xFF8ED953),
    dark: Color(0xFFA4E175),
    base: Color(0xFFBAE896),
    light: Color(0xFFD3F0BC),
    lighter: Color(0xFFEEF9E6),
  ),
  chart02: const DSColorScale(
    darker: Color(0xFFFF2E43),
    dark: Color(0xFFFF5768),
    base: Color(0xFFFF7D8A),
    light: Color(0xFFFFADB6),
    lighter: Color(0xFFFFEBED),
  ),
  chart03: const DSColorScale(
    darker: Color(0xFF973DFA),
    dark: Color(0xFFA65CE0),
    base: Color(0xFFC28FEA),
    light: Color(0xFFDABAF2),
    lighter: Color(0xFFF1E5FA),
  ),
  chart04: const DSColorScale(
    darker: Color(0xFF129173),
    dark: Color(0xFF18BE97),
    base: Color(0xFF1DE2B4),
    light: Color(0xFF9CF2DE),
    lighter: Color(0xFFE4FCF6),
  ),
  neutral: const DSNeutralScale(
    s24: Color(0xFF292929),
    s46: Color(0xFF525252),
    s72: Color(0xFFB8B8B8),
    s88: Color(0xFFE0E0E0),
    s96: Color(0xFFf5f5f5),
    s100: Color(0xFFFFFFFF),
  ),
);
