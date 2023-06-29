import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/widgets/select/components/select_bottom_sheet_child.dart';
import 'package:flutter/material.dart';

class DSSelect extends StatefulWidget {
  final DSSelectTheme? theme;
  final DSSelectStyle? style;
  final DSSelectType? type;
  final BuildContext screenContext;
  final List<Map<DSSelectKeys, dynamic>> children;
  final Function onSelected;
  final String? labelText;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool enabled;
  final bool Function(String?, String?)? filterCallback;
  final TextEditingController? controller;
  final int? maxLines;

  const DSSelect({
    super.key,
    this.theme,
    this.style,
    this.type = DSSelectType.BASE,
    required this.screenContext,
    required this.children,
    required this.onSelected,
    this.labelText,
    this.initialValue,
    this.suffixIcon,
    this.enabled = true,
    this.filterCallback,
    this.controller,
    this.maxLines,
  });

  @override
  State<DSSelect> createState() => _DSSelectState();
}

class _DSSelectState extends State<DSSelect> {
  late DSSelectTheme selectTheme;

  TextEditingController? controller;
  late List<Map<DSSelectKeys, dynamic>> children;

  void _builderTheme() {
    selectTheme = selectThemeDefault;

    if (widget.style != null) {
      selectTheme = selectTheme.copyWithOverride(selectThemeStyleMilked);
    }

    if (widget.theme != null) {
      selectTheme = selectTheme.copyWithOverride(widget.theme);
    }
  }

  @override
  void initState() {
    super.initState();

    children = widget.children;
    controller = widget.controller ??
        TextEditingController(
          text: widget.initialValue,
        );

    _builderTheme();
  }

  @override
  void didUpdateWidget(covariant DSSelect oldWidget) {
    _builderTheme();

    final List<dynamic> oldTitles = oldWidget.children
        .where((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.TITLE] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.TITLE])
        .toList();

    final List<dynamic> newTitles = widget.children
        .where((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.TITLE] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.TITLE])
        .toList();

    final List<dynamic> oldValues = oldWidget.children
        .where((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.VALUE] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.VALUE])
        .toList();

    final List<dynamic> newValues = widget.children
        .where((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.VALUE] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.VALUE])
        .toList();

    final List<dynamic> oldIcons = oldWidget.children
        .where((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.ICON] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.ICON])
        .toList();

    final List<dynamic> newIcons = widget.children
        .where((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.ICON] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.ICON])
        .toList();

    final List<bool> oldSelected = oldWidget.children
        .where(
            (Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.SELECTED] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.SELECTED] != null)
        .toList();

    final List<bool> newSelected = widget.children
        .where(
            (Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.SELECTED] != null)
        .map((Map<DSSelectKeys, dynamic> x) => x[DSSelectKeys.SELECTED] != null)
        .toList();

    bool checkIfAllValuesAreInBothLists(
        List<dynamic> listA, List<dynamic> listB) {
      if (listA.length != listB.length) {
        return false;
      }
      for (int i = 0; i < listA.length; i++) {
        if (listA[i] != listB[i]) {
          return false;
        }
      }

      return true;
    }

    final bool sameTitles =
        checkIfAllValuesAreInBothLists(oldTitles, newTitles);
    final bool sameValues =
        checkIfAllValuesAreInBothLists(oldValues, newValues);
    final bool sameIcons = checkIfAllValuesAreInBothLists(oldIcons, newIcons);

    final bool sameSelected =
        checkIfAllValuesAreInBothLists(oldSelected, newSelected);

    if (sameTitles == false ||
        sameValues == false ||
        sameIcons == false ||
        sameSelected == false) {
      setState(() {
        children = widget.children;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return DSTextField(
      enabled: widget.enabled,
      controller: controller,
      readOnly: true,
      labelText: widget.labelText,
      initialValue: widget.initialValue,
      style:
          widget.style == DSSelectStyle.MILKED ? DSTextFieldStyle.MILKED : null,
      onTap: () => _handleBottomSheet(),
      suffixIcon: _buildSuffixIcon(),
      maxLines: widget.maxLines,
    );
  }

  Future<void> _handleBottomSheet() async {
    FocusScope.of(context).unfocus();

    await DSBottomSheet(
      title: widget.labelText,
      screenContext: widget.screenContext,
      size: widget.type == DSSelectType.FILTER ? DSBottomSheetSize.LARGE : null,
      child: DSSelectBottomSheetChild(
        children: children,
        widgetType: widget.type ?? DSSelectType.BASE,
        onSelected: _handleEffectiveOnChange,
        filterCallback: widget.filterCallback,
      ),
    ).show();
  }

  void _handleEffectiveOnChange(Map<DSSelectKeys, dynamic> value) {
    widget.onSelected(value);

    _selectItem(value);

    if (value[DSSelectKeys.TITLE] != null) {
      controller?.text = value[DSSelectKeys.TITLE] as String;
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }

    setState(() {});
  }

  void _selectItem(Map<DSSelectKeys, dynamic> selectedItem) {
    children = children
        .map((Map<DSSelectKeys, dynamic> child) => {
              ...child,
              DSSelectKeys.SELECTED: selectedItem[DSSelectKeys.TITLE] ==
                      child[DSSelectKeys.TITLE] &&
                  selectedItem[DSSelectKeys.VALUE] == child[DSSelectKeys.VALUE],
            })
        .cast<Map<DSSelectKeys, dynamic>>()
        .toList();
  }

  Widget _buildSuffixIcon() =>
      widget.suffixIcon ??
      Icon(
        Icons.keyboard_arrow_down,
        color: selectTheme.iconColor,
      );
}
