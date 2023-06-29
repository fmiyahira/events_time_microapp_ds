// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:flutter/material.dart';

class DSCheckbox extends StatefulWidget {
  final DSCheckboxTheme? theme;
  final DSCheckboxStyle? style;
  final String label;
  final String? caption;
  final List<DSTextSpan>? labelSpan;
  final bool? value;
  final bool? enabled;
  final Function(bool)? onChange;

  DSCheckbox({
    super.key,
    this.theme,
    this.style,
    required this.label,
    this.caption,
    this.labelSpan,
    this.value = false,
    this.enabled = true,
    this.onChange,
  });

  @override
  State<DSCheckbox> createState() => _DSCheckboxState();
}

class _DSCheckboxState extends State<DSCheckbox> {
  late DSCheckboxTheme checkboxTheme;
  late bool _value;
  late bool _enabled;

  DSCheckboxTheme? get themeFromStyle {
    if (widget.style == null) return null;

    switch (widget.style!) {
      case DSCheckboxStyle.MILKED:
        return checkboxThemeStyleMilked;
    }
  }

  void _builderTheme() {
    checkboxTheme = checkboxThemeDefault;

    if (widget.style != null) {
      checkboxTheme = checkboxTheme.copyWithOverride(themeFromStyle);
    }

    if (widget.theme != null) {
      checkboxTheme = checkboxTheme.copyWithOverride(widget.theme);
    }
  }

  @override
  void initState() {
    super.initState();

    _value = widget.value ?? false;
    _enabled = widget.enabled ?? false;

    _builderTheme();
  }

  @override
  void didUpdateWidget(covariant DSCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _value = widget.value ?? false;
    }

    _builderTheme();
  }

  void setSelectedValue() {
    setState(() {
      _value = !_value;
      widget.onChange?.call(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = <Widget>[
      DSText(
        widget.label,
        textSpan: widget.labelSpan,
        type: DSTextType.INPUT,
        color: _enabled
            ? checkboxTheme.textColor
            : checkboxTheme.disabledTextColor,
      ),
    ];

    widget.caption.let((String it) => widgets.add(
          DSText(
            it,
            textSpan: widget.labelSpan,
            type: DSTextType.BODY_CAPTION,
            color: _enabled
                ? checkboxTheme.captionColor
                : checkboxTheme.disabledCaptionColor,
          ),
        ));

    return Center(
      child: GestureDetector(
        onTap: () => _enabled ? setSelectedValue() : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: checkboxTheme.size,
              height: checkboxTheme.size,
              margin: const EdgeInsets.only(
                top: kComponentSpacerXS,
                right: kComponentSpacerS,
              ),
              decoration: _buildDecoration(),
              child: _buildIcon(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() => _value
      ? Icon(
          Icons.check,
          size: checkboxTheme.iconSize,
          color: _enabled
              ? checkboxTheme.iconColor
              : checkboxTheme.disabledIconColor,
        )
      : SizedBox(
          height: checkboxTheme.iconSize,
          width: checkboxTheme.iconSize,
        );

  BoxDecoration _buildDecoration() {
    final BoxDecoration uncheckedBox = _createBoxDecoration(
      checkboxTheme.borderColor ?? Colors.transparent,
      checkboxTheme.fillColor ?? Colors.transparent,
    );

    final BoxDecoration checkedBox = _createBoxDecoration(
      checkboxTheme.checkedBorderColor ?? Colors.transparent,
      checkboxTheme.checkedFillColor ?? Colors.transparent,
    );

    final BoxDecoration disabledBox = _createBoxDecoration(
      checkboxTheme.disabledBorderColor ?? Colors.transparent,
      _value
          ? checkboxTheme.disabledFillColor ?? Colors.transparent
          : checkboxTheme.fillColor ?? Colors.transparent,
    );

    return _enabled ? (_value ? checkedBox : uncheckedBox) : disabledBox;
  }

  BoxDecoration _createBoxDecoration(Color borderColor, Color color) {
    const double borderWidth = 2.0;
    const double borderRadius = 2.0;

    return BoxDecoration(
      border: Border.all(color: borderColor, width: borderWidth),
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}
