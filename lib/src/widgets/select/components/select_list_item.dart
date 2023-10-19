// ignore_for_file: no_default_cases

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class SelectListItem extends StatelessWidget {
  final DSSelectType widgetType;
  final Map<DSSelectKeys, dynamic> value;
  final Function onChange;
  final String? category;

  const SelectListItem({
    super.key,
    required this.widgetType,
    required this.value,
    required this.onChange,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    switch (widgetType) {
      case DSSelectType.ICON:
        return DSNavListItemIcon(
          selected: value[DSSelectKeys.SELECTED] as bool? ?? false,
          title: value[DSSelectKeys.TITLE] as String? ?? '',
          onTap: () {
            onChange(value);
          },
        );
      case DSSelectType.CATEGORY:
        return DSNavListItemElement(
          theme: DSNavListItemElementTheme(
            paddingVertical: kLayoutSpacerS,
            paddingLeftElement: kLayoutSpacerS,
          ),
          selected: value[DSSelectKeys.SELECTED] as bool? ?? false,
          title: value[DSSelectKeys.TITLE] as String? ?? '',
          category: category,
          onTap: () {
            onChange(value);
          },
        );
      case DSSelectType.FILTER:
      default:
        return DSNavListItemElement(
          selected: value[DSSelectKeys.SELECTED] as bool? ?? false,
          title: value[DSSelectKeys.TITLE] as String? ?? '',
          onTap: () {
            onChange(value);
          },
        );
    }
  }
}
