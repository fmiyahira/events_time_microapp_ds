// ignore_for_file: no_default_cases

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/widgets/select/components/select_list_item.dart';
import 'package:flutter/material.dart';

class DSSelectBottomSheetChild extends StatefulWidget {
  final List<Map<DSSelectKeys, dynamic>> children;
  final DSSelectType widgetType;
  final Function(Map<DSSelectKeys, dynamic>) onSelected;
  final bool Function(String?, String?)? filterCallback;

  const DSSelectBottomSheetChild({
    super.key,
    required this.children,
    required this.widgetType,
    required this.onSelected,
    this.filterCallback,
  });

  @override
  State<DSSelectBottomSheetChild> createState() =>
      _DSSelectBottomSheetChildState();
}

class _DSSelectBottomSheetChildState extends State<DSSelectBottomSheetChild> {
  String? filterString;
  late List<Map<DSSelectKeys, dynamic>> children;
  late List<dynamic> categorylist;
  List<String> categories = <String>[];
  String? category;

  bool _filter({String? str, String? value}) {
    if (widget.filterCallback == null) {
      if (str != null && value != null) {
        return value.toLowerCase().startsWith(str.toLowerCase());
      }

      return true;
    }

    return widget.filterCallback!(str, value);
  }

  @override
  void initState() {
    super.initState();
    children = widget.children;
    categorylist = children.groupBy(DSSelectKeys.CATEGORY);

    if ((children.elementAt(0)[DSSelectKeys.CATEGORY] as String?) != null) {
      categories.add(children.elementAt(0)[DSSelectKeys.CATEGORY] as String);
    }
  }

  @override
  void didUpdateWidget(covariant DSSelectBottomSheetChild oldWidget) {
    if (oldWidget.children != children) {
      children = widget.children;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  void _selectItem(Map<DSSelectKeys, dynamic> selectedItem) {
    children = children
        .map(
          (Map<DSSelectKeys, dynamic> child) => <DSSelectKeys, dynamic>{
            ...child,
            DSSelectKeys.SELECTED: selectedItem[DSSelectKeys.TITLE] ==
                    child[DSSelectKeys.TITLE] &&
                selectedItem[DSSelectKeys.VALUE] == child[DSSelectKeys.VALUE],
          },
        )
        .cast<Map<DSSelectKeys, dynamic>>()
        .toList();

    widget.onSelected(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.widgetType) {
      case DSSelectType.FILTER:
        return Column(
          children: <Widget>[
            DSTextField(
                type: DSTextFieldType.FILTER,
                labelText: 'Filtrar',
                onChanged: (String str) {
                  setState(() {
                    filterString = str;
                  });
                }),
            DSIterator(
              scrollEnabled: false,
              size: DSIteratorSize.MINIMAL,
              children: children
                  .where((Map<DSSelectKeys, dynamic> element) => _filter(
                        str: filterString,
                        value: element[DSSelectKeys.TITLE] as String?,
                      ))
                  .map((Map<DSSelectKeys, dynamic> item) {
                return Column(
                  children: <Widget>[
                    SelectListItem(
                      widgetType: widget.widgetType,
                      value: item,
                      onChange: (Map<DSSelectKeys, dynamic> value) async {
                        _selectItem(value);
                        setState(() {});
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        );

      case DSSelectType.CATEGORY:
        final List<Map<DSSelectKeys, dynamic>> listChildren = getMapList();

        return DSIterator(
          scrollEnabled: false,
          size: DSIteratorSize.MINIMAL,
          children: listChildren.map((Map<DSSelectKeys, dynamic> item) {
            final int idx = listChildren.indexOf(item);

            if (categories.contains(item[DSSelectKeys.CATEGORY]) && idx != 0) {
              category = null;
            } else {
              categories.add(
                  listChildren.elementAt(idx)[DSSelectKeys.CATEGORY] as String);
              category = item[DSSelectKeys.CATEGORY] as String?;
            }

            return Column(
              children: <Widget>[
                SelectListItem(
                  category: category,
                  widgetType: widget.widgetType,
                  value: item,
                  onChange: (Map<DSSelectKeys, dynamic> value) async {
                    _selectItem(value);
                    setState(() {});
                  },
                )
              ],
            );
          }).toList(),
        );
      default:
        return DSIterator(
          scrollEnabled: false,
          size: DSIteratorSize.MINIMAL,
          children: children.map((Map<DSSelectKeys, dynamic> item) {
            return Column(
              children: <Widget>[
                SelectListItem(
                  widgetType: widget.widgetType,
                  value: item,
                  onChange: (Map<DSSelectKeys, dynamic> value) async {
                    _selectItem(value);
                    setState(() {});
                  },
                ),
              ],
            );
          }).toList(),
        );
    }
  }

  List<Map<DSSelectKeys, dynamic>> getMapList() {
    final List<dynamic> children = <dynamic>[];

    for (int i = 0; i < categorylist.length; i++) {
      children.add(categorylist[i]['Category ${i + 1}']);
    }

    final List<Map<DSSelectKeys, dynamic>> mapList = [];
    for (final dynamic e in children) {
      final Map<DSSelectKeys, dynamic> item = <DSSelectKeys, dynamic>{
        DSSelectKeys.CATEGORY: e
      };
      mapList.add(item);
    }

    final List<Map<DSSelectKeys, dynamic>> list =
        <Map<DSSelectKeys, dynamic>>[];
    for (int i = 0; i < mapList.length; i++) {
      for (int j = 0;
          j < (mapList[i][DSSelectKeys.CATEGORY] as List<dynamic>).length;
          j++) {
        list.add(
            mapList[i][DSSelectKeys.CATEGORY][j] as Map<DSSelectKeys, dynamic>);
      }
    }

    return list;
  }

  List<String> getCategories(List<Map<DSSelectKeys, dynamic>> mapList) {
    final List<String> allCategories = <String>[];
    for (int i = 0; i < mapList.length; i++) {
      allCategories.add(mapList[i][DSSelectKeys.CATEGORY] as String);
    }

    return allCategories;
  }
}

extension UtilListExtension on List<dynamic> {
  List<dynamic> groupBy(DSSelectKeys key) {
    try {
      final List<Map<String, dynamic>> result = <Map<String, dynamic>>[];
      final List<String> keys = <String>[];
      int idx = 1;

      for (final dynamic f in this) {
        keys.add(f[key] as String);
      }

      for (final String k in <String>[...keys.toSet()]) {
        final List<dynamic> data = <dynamic>[
          ...where((dynamic e) => e[key] == k)
        ];
        result.add(<String, dynamic>{'category $idx': data});
        idx++;
      }

      return result;
    } catch (_) {
      return this;
    }
  }
}
