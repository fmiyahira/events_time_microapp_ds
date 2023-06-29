// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSNavListItemBase extends StatelessWidget {
  late DSNavListItemBaseTheme navListItemBaseTheme;

  final DSNavListItemBaseTheme? theme;
  final DSNavListItemBaseStyle? style;
  final DSNavListItemBaseSize? size;
  final String title;
  final Function()? onTap;

  DSNavListItemBase({
    super.key,
    required this.title,
    this.onTap,
    this.style,
    this.size,
    this.theme,
  });

  DSNavListItemBaseTheme? get themeFromSize {
    if (size == null) return null;

    switch (size!) {
      case DSNavListItemBaseSize.LARGE:
        return navListItemBaseThemeSizeLarge;
      case DSNavListItemBaseSize.SMALL:
        return navListItemBaseThemeSizeSmall;
    }
  }

  @override
  Widget build(BuildContext context) {
    navListItemBaseTheme = navListItemBaseThemeDefault;

    if (style != null) {
      navListItemBaseTheme = navListItemBaseTheme
          .copyWithOverride(navListItemBaseThemeStyleMilked);
    }

    if (size != null) {
      navListItemBaseTheme =
          navListItemBaseTheme.copyWithOverride(themeFromSize);
    }

    if (theme != null) {
      navListItemBaseTheme = navListItemBaseTheme.copyWithOverride(theme);
    }

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: navListItemBaseTheme.minWidth,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: navListItemBaseTheme.borderWidth ?? 0,
          color: navListItemBaseTheme.borderColor ?? Colors.transparent,
        ))),
        alignment: navListItemBaseTheme.alignment,
        child: Padding(
          padding: EdgeInsets.only(
            top: navListItemBaseTheme.paddingTop ?? 0,
            bottom: navListItemBaseTheme.paddingBottom ?? 0,
          ),
          child: DSText(
            title,
            style: navListItemBaseTheme.titleStyle,
            type: navListItemBaseTheme.titleType!,
            color: navListItemBaseTheme.titleColor,
          ),
        ),
      ),
    );
  }
}
