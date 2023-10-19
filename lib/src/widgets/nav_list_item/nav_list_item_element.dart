// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:flutter/material.dart';

class DSNavListItemElement extends StatelessWidget {
  late DSNavListItemElementTheme navListItemElementTheme;

  final DSNavListItemElementTheme? theme;
  final DSNavListItemElementStyle? style;
  final String title;
  final String? caption;
  final Function()? onTap;
  final bool? selected;
  final String? category;

  DSNavListItemElement({
    super.key,
    this.theme,
    this.style,
    required this.title,
    this.caption,
    this.onTap,
    this.selected = false,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    navListItemElementTheme = navListItemElementThemeDefault;

    if (style != null) {
      navListItemElementTheme = navListItemElementTheme
          .copyWithOverride(navListItemElementThemeStyleMilked);
    }

    if (theme != null) {
      navListItemElementTheme = navListItemElementTheme.copyWithOverride(theme);
    }

    final List<DSText> widgets = <DSText>[
      DSText(
        title,
        type: DSTextType.HEADING4,
        style: navListItemElementTheme.titleStyle,
      ),
    ];

    caption.let(
      (String it) => widgets.add(
        DSText(
          it,
          type: DSTextType.BODY_CAPTION,
          style: navListItemElementTheme.titleStyle,
          color: style == DSNavListItemElementStyle.MILKED
              ? DSColors.neutral.s100
              : DSColors.neutral.s46,
        ),
      ),
    );

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                visible: category != null,
                child: Padding(
                  padding: const EdgeInsets.only(top: kLayoutSpacerM),
                  child: DSText(category ?? '', type: DSTextType.HEADING4),
                ),
              )
            ],
          ),
          Container(
            alignment: navListItemElementTheme.alignment,
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: navListItemElementTheme.borderWidth!,
                color: navListItemElementTheme.borderColor!,
              ),
            )),
            padding: EdgeInsets.symmetric(
              vertical: navListItemElementTheme.paddingVertical!,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: navListItemElementTheme.paddingLeftElement,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DSText(
                        title,
                        type: DSTextType.INPUT,
                        style: navListItemElementTheme.titleStyle,
                        color: selected!
                            ? navListItemElementTheme.selectedColor
                            : null,
                      ),
                      if (caption != null)
                        DSText(
                          caption!,
                          type: DSTextType.BODY_CAPTION,
                          style: navListItemElementTheme.titleStyle,
                          color: style == DSNavListItemElementStyle.MILKED
                              ? DSColors.neutral.s100
                              : DSColors.neutral.s46,
                        ),
                    ],
                  ),
                  if (selected!)
                    Icon(
                      Icons.check,
                      color: navListItemElementTheme.selectedColor,
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
