import 'dart:ui';

import 'package:events_time_microapp_ds/src/widgets/switcher/switcher_theme.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  final DSSwitcherTheme theme;
  final bool changeWithoutTapping;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.theme,
    this.changeWithoutTapping = false,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool switchOn = true;
  bool initialValue = true;

  @override
  void initState() {
    super.initState();

    initialValue = widget.value;
    switchOn = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    switchOn = widget.changeWithoutTapping ? widget.value : switchOn;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: initialValue ? 1 : 0,
        end: switchOn ? 1 : 0,
      ),
      duration: const Duration(milliseconds: 60),
      builder: (_, double value, __) {
        return GestureDetector(
          onTap: () {
            switchOn = !switchOn;
            widget.onChanged(switchOn);
            if (!widget.changeWithoutTapping) {
              setState(() {});
            }
          },
          child: Container(
            width: widget.theme.baseWidth,
            height: widget.theme.baseHeight,
            decoration: BoxDecoration(
              borderRadius: widget.theme.baseBorderRadius,
              color: switchOn
                  ? widget.theme.baseOnColor
                  : widget.theme.baseOffColor,
            ),
            padding: widget.theme.padding,
            alignment: Alignment(
              lerpDouble(-1, 1, value)!,
              0,
            ),
            child: Container(
              width: widget.theme.pullerWidth,
              height: widget.theme.pullerHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.theme.pullerColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
