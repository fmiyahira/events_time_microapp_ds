// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:flutter/material.dart';

class DSNavListItemChevron extends StatelessWidget {
  late DSNavListItemChevronTheme navListItemChevronTheme;

  final DSNavListItemChevronTheme? theme;
  final DSNavListItemChevronStyle? style;
  final String title;
  final dynamic leading;
  final String? caption;
  final Function()? onTap;

  DSNavListItemChevron({
    super.key,
    this.theme,
    this.style,
    required this.title,
    this.leading,
    this.caption,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    navListItemChevronTheme = navListItemChevronThemeDefault;

    if (style != null) {
      navListItemChevronTheme = navListItemChevronTheme
          .copyWithOverride(navListItemChevronThemeStyleMilked);
    }
    navListItemChevronTheme = navListItemChevronTheme.copyWithOverride(theme);

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: navListItemChevronTheme.borderWidth!,
              color: navListItemChevronTheme.borderColor!,
            ),
          ),
        ),
        child: Container(
          padding: navListItemChevronTheme.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    ..._buildLeading(),
                    ..._buildBody(),
                  ],
                ),
              ),
              const SizedBox(height: kComponentSpacerL),
              Icon(
                Icons.chevron_right,
                size: navListItemChevronTheme.trailingSize,
                color: navListItemChevronTheme.trailingColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLeading() {
    final List<Widget> widgets = <Widget>[];

    if (leading != null) {
      if (leading is IconData) {
        widgets.add(Icon(
          leading as IconData,
          size: navListItemChevronTheme.leadingSize,
          color: navListItemChevronTheme.leadingColor,
        ));
      }

      if (leading is String) {
        widgets.add(DSAssets.render(
          leading as String,
          width: navListItemChevronTheme.leadingSize,
          height: navListItemChevronTheme.leadingSize,
        ));
      }

      widgets.add(const SizedBox(
        width: kComponentSpacerL,
      ));
    }

    return widgets;
  }

  List<Widget> _buildBody() {
    final List<Widget> widgets = <Widget>[
      DSText(
        title,
        type: DSTextType.BODY,
        color: navListItemChevronTheme.titleColor,
      ),
    ];

    caption.let(
      (String it) => widgets.addAll(
        <Widget>[
          DSText(
            it,
            type: DSTextType.BODY_CAPTION,
            color: navListItemChevronTheme.captionColor,
          ),
        ],
      ),
    );

    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
    ];
  }
}
