// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/widgets/switcher/custom_switcher.dart';
import 'package:flutter/material.dart';

class DSSwitcher extends StatefulWidget {
  final DSSwitcherTheme? theme;
  final DSSwitcherStyle? style;
  final String text;
  final Function(bool)? onClick;
  bool isOn;
  bool changeWithoutTapping;

  DSSwitcher({
    super.key,
    this.theme,
    this.style,
    this.isOn = false,
    required this.text,
    this.onClick,
    this.changeWithoutTapping = false,
  });

  @override
  State<DSSwitcher> createState() => _DSSwitcherState();
}

class _DSSwitcherState extends State<DSSwitcher> {
  late DSSwitcherTheme switcherTheme;

  void _builderTheme() {
    switcherTheme = switcherThemeDefault;

    if (widget.style != null) {
      switcherTheme = switcherTheme.copyWithOverride(switcherThemeStyleMilked);
    }

    if (widget.theme != null) {
      switcherTheme = switcherTheme.copyWithOverride(widget.theme);
    }
  }

  @override
  void initState() {
    super.initState();
    _builderTheme();
  }

  @override
  void didUpdateWidget(covariant DSSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    _builderTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: switcherTheme.paddingText,
            child: DSText(
              widget.text,
              type: DSTextType.INPUT,
              style: widget.style == DSSwitcherStyle.MILKED
                  ? DSTextStyle.MILKED
                  : null,
            ),
          ),
        ),
        CustomSwitch(
          value: widget.isOn,
          onChanged: (bool value) => widget.onClick?.call(value),
          theme: switcherTheme,
          changeWithoutTapping: widget.changeWithoutTapping,
        ),
      ],
    );
  }
}
