// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:flutter/material.dart';

class DSNavListItemIcon extends StatelessWidget {
  late DSNavListItemIconTheme navListItemIconTheme;

  final DSNavListItemIconTheme? theme;
  final DSNavListItemIconStyle? style;
  final String title;
  final String? caption;
  final IconData? leading;
  final Function()? onTap;
  final bool? selected;

  DSNavListItemIcon({
    super.key,
    this.theme,
    this.style,
    required this.title,
    this.caption,
    this.leading,
    this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    navListItemIconTheme = navListItemIconThemeDefault;

    if (style != null) {
      navListItemIconTheme = navListItemIconTheme
          .copyWithOverride(navListItemIconThemeStyleMilked);
    }

    if (theme != null) {
      navListItemIconTheme = navListItemIconTheme.copyWithOverride(theme);
    }

    final List<Widget> widgets = <Widget>[];

    leading.let(
      (IconData it) => widgets.add(
        Icon(
          it,
          color: navListItemIconTheme.leadingColor,
        ),
      ),
    );

    widgets.add(const SizedBox(
      width: kComponentSpacerXXL,
    ));

    final List<Widget> widgetsCaption = <Widget>[
      DSText(
        title,
        type: DSTextType.HEADING4,
        style: navListItemIconTheme.titleStyle,
        color: navListItemIconTheme.titleColor,
      ),
    ];

    caption.let((String it) => widgetsCaption.add(DSText(
          it,
          type: DSTextType.BODY_CAPTION,
          style: navListItemIconTheme.captionStyle,
          color: navListItemIconTheme.captionColor,
        )));

    widgets.add(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetsCaption,
    ));

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            width: navListItemIconTheme.borderWidth ?? 0,
            color: navListItemIconTheme.borderColor ?? Colors.transparent,
          ),
        )),
        padding: EdgeInsets.symmetric(
            vertical: navListItemIconTheme.paddingVertical ?? 0),
        child: Row(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (leading != null)
                  Icon(
                    leading,
                    color: selected!
                        ? navListItemIconTheme.selectedColor
                        : navListItemIconTheme.titleColor,
                  ),
                const SizedBox(
                  width: kComponentSpacerL,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DSText(
                      title,
                      style: navListItemIconTheme.titleStyle,
                      type: DSTextType.INPUT,
                      color: selected!
                          ? navListItemIconTheme.selectedColor
                          : navListItemIconTheme.titleColor,
                    ),
                    if (caption != null)
                      DSText(
                        caption!,
                        type: DSTextType.BODY_CAPTION,
                        style: navListItemIconTheme.captionStyle,
                        color: navListItemIconTheme.captionColor,
                      ),
                  ],
                ),
              ],
            ),
            if (selected!)
              Icon(
                Icons.check,
                color: navListItemIconTheme.selectedColor,
              ),
          ],
        ),
      ),
    );
  }
}
