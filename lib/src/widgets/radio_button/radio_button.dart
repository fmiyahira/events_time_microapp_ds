import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:events_time_microapp_ds/src/widgets/radio_button/components/custom_radio_button.dart';
import 'package:flutter/material.dart';

class DSRadioButton extends StatefulWidget {
  final DSRadioButtonTheme? theme;
  final DSRadioButtonStyle? style;
  final List<RadioButtonContent>? buttons;
  final int? selectedIndex;
  final bool? enabled;
  final Function(int)? onChanged;

  const DSRadioButton({
    super.key,
    this.style,
    this.theme,
    this.buttons,
    this.selectedIndex,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<DSRadioButton> createState() => _DSRadioButtonState();
}

class _DSRadioButtonState extends State<DSRadioButton> {
  late DSRadioButtonTheme radioButtonTheme;
  late int _selectedIndex;
  late List<RadioButtonContent> _buttons;

  DSRadioButtonTheme? get themeFromStyle {
    if (widget.style == null) return null;

    switch (widget.style!) {
      case DSRadioButtonStyle.MILKED:
        return radioButtonThemeStyleMilked;
    }
  }

  void _builderTheme() {
    radioButtonTheme = radioButtonThemeDefault;

    if (widget.style != null) {
      radioButtonTheme = radioButtonTheme.copyWithOverride(themeFromStyle);
    }

    if (widget.theme != null) {
      radioButtonTheme = radioButtonTheme.copyWithOverride(widget.theme);
    }
  }

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.selectedIndex ?? 0;

    widget.buttons.let((List<RadioButtonContent> it) {
      if (it.isNotEmpty) {
        _buttons = it;
      }
    });

    _builderTheme();
  }

  @override
  void didUpdateWidget(covariant DSRadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_selectedIndex != widget.selectedIndex) {
      setState(() {
        _selectedIndex = widget.selectedIndex ?? 0;
      });
    }

    _builderTheme();
  }

  void _updateRadioButtonValue(int index) {
    widget.onChanged?.call(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buttons
          .asMap()
          .map((int i, RadioButtonContent item) =>
              MapEntry<int, Widget>(i, _buildItem(i, item)))
          .values
          .toList(),
    );
  }

  Widget _buildItem(int index, RadioButtonContent item) {
    final List<Widget> widgets = <Widget>[
      DSText(
        item.title,
        type: DSTextType.INPUT,
        color: widget.enabled ?? false
            ? radioButtonTheme.textColor
            : radioButtonTheme.inactiveColor,
      )
    ];
    item.caption.let((String it) => widgets.add(DSText(
          it,
          type: DSTextType.BODY_CAPTION,
          color: widget.enabled ?? false
              ? radioButtonTheme.captionTextColor
              : radioButtonTheme.inactiveColor,
        )));

    return GestureDetector(
      onTap: () => _updateRadioButtonValue(index),
      child: Container(
        color: Colors.transparent,
        margin: radioButtonTheme.margin,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: radioButtonTheme.radioMargin,
              child: DSCustomRadioButton(
                borderColor: widget.enabled ?? false
                    ? (_selectedIndex == index
                        ? radioButtonTheme.radioColor
                        : radioButtonTheme.borderColor)
                    : radioButtonTheme.inactiveColor,
                pinColor: widget.enabled ?? false
                    ? (_selectedIndex == index
                        ? radioButtonTheme.radioColor
                        : radioButtonTheme.pinColor)
                    : radioButtonTheme.borderColor,
                selected: widget.enabled,
                onChange: (_) => _updateRadioButtonValue(index),
              ),
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
}
