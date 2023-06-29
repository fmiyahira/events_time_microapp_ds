// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/src/widgets/circle_button/circle_button_theme.dart';
import 'package:flutter/material.dart';

class DSCircleButton extends StatelessWidget {
  late DSCircleButtonTheme circleButtonTheme;

  final DSCircleButtonTheme? theme;
  final DSCircleButtonStyle? style;
  final DSCircleButtonSize? size;
  final IconData icon;
  final Function()? onPressed;

  DSCircleButton({
    super.key,
    this.theme,
    this.style,
    this.size,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    circleButtonTheme = circleButtonThemeDefault;

    if (style != null) {
      circleButtonTheme =
          circleButtonTheme.copyWithOverride(circleButtonThemeStyleMilked);
    }

    if (size != null) {
      circleButtonTheme =
          circleButtonTheme.copyWithOverride(circleButtonThemeSizeSmall);
    }

    circleButtonTheme = circleButtonTheme.copyWithOverride(theme);

    return ClipOval(
      child: Material(
        color: circleButtonTheme.buttonColor,
        child: InkWell(
          splashColor: circleButtonTheme.pressedButtonColor,
          onTap: onPressed,
          child: SizedBox(
            width: circleButtonTheme.minWidth,
            height: circleButtonTheme.minHeight,
            child: Icon(
              icon,
              color: circleButtonTheme.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
