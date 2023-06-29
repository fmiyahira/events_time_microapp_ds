// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSNavListItemBaseStyle { MILKED }

enum DSNavListItemBaseSize { SMALL, LARGE }

class DSNavListItemBaseTheme {
  final DSTextStyle? titleStyle;
  final DSTextType? titleType;
  final Color? titleColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? minWidth;
  final double? paddingTop;
  final double? paddingBottom;
  final AlignmentGeometry? alignment;

  DSNavListItemBaseTheme({
    this.titleStyle,
    this.titleType,
    this.titleColor,
    this.borderColor,
    this.borderWidth,
    this.minWidth,
    this.paddingTop,
    this.paddingBottom,
    this.alignment,
  });

  DSNavListItemBaseTheme copyWithOverride(
      DSNavListItemBaseTheme? themeOverride) {
    return DSNavListItemBaseTheme(
      titleStyle: themeOverride?.titleStyle ?? titleStyle,
      titleType: themeOverride?.titleType ?? titleType,
      titleColor: themeOverride?.titleColor ?? titleColor,
      borderColor: themeOverride?.borderColor ?? borderColor,
      borderWidth: themeOverride?.borderWidth ?? borderWidth,
      minWidth: themeOverride?.minWidth ?? minWidth,
      paddingTop: themeOverride?.paddingTop ?? paddingTop,
      paddingBottom: themeOverride?.paddingBottom ?? paddingBottom,
      alignment: themeOverride?.alignment ?? alignment,
    );
  }
}

const double _paddingTop = 24.0;
const double _paddingBottom = 20.0;
const double _paddingTopLarge = 40.0;
const double _paddingBottomLarge = 32.0;
const double _broderWidth = 1.0;
const double _broderColorOpacity = 0.2;
const AlignmentGeometry _alignment = AlignmentDirectional.centerStart;

final DSNavListItemBaseTheme navListItemBaseThemeDefault =
    DSNavListItemBaseTheme(
  titleType: DSTextType.LABEL,
  minWidth: double.infinity,
  borderColor: DSColors.neutral.s88,
  borderWidth: _broderWidth,
  alignment: _alignment,
  paddingTop: _paddingTop,
  paddingBottom: _paddingBottom,
);

final DSNavListItemBaseTheme navListItemBaseThemeStyleMilked =
    DSNavListItemBaseTheme(
  titleStyle: DSTextStyle.MILKED,
  titleColor: DSColors.neutral.s100,
  borderColor: DSColors.neutral.s100.withOpacity(_broderColorOpacity),
);

final DSNavListItemBaseTheme navListItemBaseThemeSizeSmall =
    DSNavListItemBaseTheme(
  titleType: DSTextType.LABEL_SMALL,
);

final DSNavListItemBaseTheme navListItemBaseThemeSizeLarge =
    DSNavListItemBaseTheme(
  paddingTop: _paddingTopLarge,
  paddingBottom: _paddingBottomLarge,
);
