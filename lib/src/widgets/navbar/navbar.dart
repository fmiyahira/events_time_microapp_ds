// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DSNavBar extends StatelessWidget implements PreferredSizeWidget {
  late DSNavBarTheme navBarTheme;

  final DSNavBarTheme? theme;
  final DSNavBarStyle? style;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;

  final bool hasError = false;

  @override
  Size get preferredSize => const Size.fromHeight(kNavBarHeight);

  DSNavBar({
    super.key,
    this.theme,
    this.style,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle = true,
  });

  DSNavBarTheme? get themeFromStyle {
    if (style == null) return null;

    switch (style!) {
      case DSNavBarStyle.MILKED:
        return navBarThemeStyleMilked;
    }
  }

  @override
  Widget build(BuildContext context) {
    navBarTheme = navBarThemeDefault;

    if (style != null) {
      navBarTheme = navBarTheme.copyWithOverride(themeFromStyle);
    }

    if (theme != null) {
      navBarTheme = navBarTheme.copyWithOverride(theme);
    }

    _updateStyle();
    _updateChild();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: navBarTheme.brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Container(
        padding: _navbarPadding(context),
        width: double.infinity,
        color: navBarTheme.backgroundColor,
        child: NavigationToolbar(
          centerMiddle: centerTitle,
          leading: leading ?? _emptySpacer,
          middle: title,
          trailing: _buildTrailing,
        ),
      ),
    );
  }

  Map<Type, dynamic> get _listOfChildren => <Type, dynamic>{
        DSText: DSTextStyle.MILKED,
        DSIconButton: DSIconButtonStyle.MILKED,
      };

  void _updateStyleMilked(Widget? widget) {
    if (widget == null) return;

    dynamic referenceToWidget;
    _listOfChildren.forEach((Type type, dynamic value) {
      if (style == DSNavBarStyle.MILKED &&
          type.toString() == widget.toString()) {
        referenceToWidget = widget;
        referenceToWidget.style = value;
      }
    });
  }

  void _updateStyle() {
    _updateStyleMilked(leading);
    _updateStyleMilked(title);

    void updateWidget(Widget action) => _updateStyleMilked(action);

    actions?.forEach(updateWidget);
  }

  void _updateAlignment(Widget? widget, AlignmentGeometry alignment) {
    if (widget is DSIconButton) {
      widget.theme = widget.theme?.copyWithOverride(DSIconButtonTheme(
        buttonSize: 32.0,
        // iconPadding: 0,
        alignment: alignment,
      ));
    }
  }

  void _updateChild() {
    _updateAlignment(leading, Alignment.bottomLeft);
    _updateAlignment(title, Alignment.bottomCenter);

    void updateAlignments(Widget action) =>
        _updateAlignment(action, Alignment.bottomRight);

    actions?.forEach(updateAlignments);
  }

  Widget get _buildTrailing => Row(
        mainAxisSize: MainAxisSize.min,
        children: actions != null ? _buildActions : <Widget>[_emptySpacer],
      );

  List<Widget> get _buildActions {
    final List<Widget> newActions = <Widget>[];

    actions!.asMap().forEach((int index, Widget value) {
      newActions.add(value);
      final int length = actions!.length;
      if (index < length - 1) {
        newActions.add(const SizedBox(
          width: kComponentSpacerS,
        ));
      }
    });

    return newActions;
  }

  EdgeInsets _navbarPadding(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    const double largeNotch = 44.0;

    return EdgeInsets.only(
      top: statusBarHeight +
          (statusBarHeight >= largeNotch
              ? kLayoutSpacerXXXS
              : navBarTheme.paddingTop ?? 0),
      bottom: navBarTheme.paddingBottom ?? 0,
      left: navBarTheme.paddingLeft ?? 0,
      right: navBarTheme.paddingRight ?? 0,
    );
  }

  Widget get _emptySpacer => const SizedBox(width: 32);
}
