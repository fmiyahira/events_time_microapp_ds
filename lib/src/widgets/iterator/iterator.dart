// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'all.dart';

class DSIterator extends StatelessWidget {
  late DSIteratorTheme iteratorTheme;

  final DSIteratorTheme? theme;
  final DSIteratorSize? size;
  final List<Widget> children;
  final bool scrollEnabled;

  DSIterator({
    super.key,
    this.size,
    this.theme,
    required this.children,
    this.scrollEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    iteratorTheme = iteratorThemeDefault;

    if (size != null) {
      iteratorTheme = iteratorTheme.copyWithOverride(iteratorThemeSizeMinimal);
    }

    if (theme != null) {
      iteratorTheme = iteratorTheme.copyWithOverride(theme);
    }

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: iteratorTheme.gutterSize,
      ),
      itemCount: children.length,
      physics: scrollEnabled
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
    );
  }
}
