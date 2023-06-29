// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  late DSToastTheme toastTheme;
  final DSToastTheme? theme;
  final String text;
  final VoidCallback? dismiss;

  ToastWidget({
    super.key,
    this.theme,
    required this.text,
    required this.dismiss,
  });

  @override
  Widget build(BuildContext context) {
    toastTheme = toastThemeDefault.copyWithOverride(theme);

    final List<Widget> widgets = <Widget>[
      Expanded(
        child: DSText(
          text,
          type: DSTextType.BODY_SMALL,
          color: toastTheme.textColor,
        ),
      ),
    ];

    widgets.add(
      Row(
        children: <Widget>[
          const SizedBox(
            width: kComponentSpacerL,
          ),
          DSIconButton(
            icon: Icons.close,
            onPressed: dismiss,
            theme: DSIconButtonTheme(
              buttonSize: toastTheme.buttonSize,
              iconSize: toastTheme.iconSize,
              iconPadding: toastTheme.iconPadding,
              iconColor: DSColors.neutral.s100,
            ),
          ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) => Stack(
        children: <Widget>[
          Positioned(
            width: constraints.minWidth,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                (toastTheme.margin ?? 0.0),
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: toastTheme.color,
                    borderRadius:
                        BorderRadius.circular(toastTheme.borderRadius ?? 0),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(toastTheme.padding ?? 0),
                  margin: EdgeInsets.symmetric(
                      horizontal: toastTheme.horizontalMargin ?? 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widgets,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
