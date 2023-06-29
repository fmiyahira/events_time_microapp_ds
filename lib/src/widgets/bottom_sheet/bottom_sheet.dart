// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/src/widgets/bottom_sheet/bottom_sheet_theme.dart';
import 'package:events_time_microapp_ds/src/widgets/bottom_sheet/components/bottom_sheet_default.dart';
import 'package:events_time_microapp_ds/src/widgets/bottom_sheet/components/bottom_sheet_header.dart';
import 'package:flutter/material.dart';

import '../../common/constants/all.dart';
import '../../common/helpers/all.dart';

class DSBottomSheet extends StatelessWidget with DSBottomSheetDefault {
  late DSBottomSheetTheme bottomSheetTheme;
  final DSBottomSheetTheme? theme;
  final DSBottomSheetSize? size;
  final DSBottomSheetType? type;
  final String? title;
  final String? topImage;
  final Widget child;

  @override
  final BuildContext screenContext;

  final bool scrollEnabled;
  final bool useDefaultPadding;

  @override
  final Function()? onDismiss;

  @override
  Widget get self => this;

  DSBottomSheet({
    super.key,
    this.theme,
    this.size,
    this.type,
    this.title,
    required this.child,
    required this.screenContext,
    this.scrollEnabled = true,
    this.useDefaultPadding = true,
    this.onDismiss,
  }) : topImage = null;

  DSBottomSheet.withImage({
    super.key,
    this.theme,
    this.type,
    required this.topImage,
    required this.child,
    required this.screenContext,
    this.scrollEnabled = true,
    this.useDefaultPadding = true,
    this.onDismiss,
  })  : title = null,
        size = null;

  DSBottomSheetTheme? get themeFromType {
    if (type == null) return null;

    switch (type!) {
      case DSBottomSheetType.LEAN:
        return bottomSheetThemeTypeLean;
    }
  }

  DSBottomSheetTheme? get themeFromSize {
    if (size == null) return null;

    switch (size!) {
      case DSBottomSheetSize.LARGE:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomSheetTheme = bottomSheetThemeDefault;

    if (type != null) {
      bottomSheetTheme = bottomSheetTheme.copyWithOverride(themeFromType);
    }

    if (size != null) {
      bottomSheetTheme = bottomSheetTheme.copyWithOverride(themeFromSize);
    }

    if (theme != null) {
      bottomSheetTheme = bottomSheetTheme.copyWithOverride(theme);
    }

    return topImage != null
        ? _buildStackContent(context)
        : _buildContext(context);
  }

  Widget _buildStackContent(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: <Widget>[
        _buildContext(context),
        Positioned(
          top: -((bottomSheetTheme.topImageHeight ?? 0) / 2),
          child: DSAssets.render(
            topImage ?? '',
            height: bottomSheetTheme.topImageHeight,
          ),
        ),
      ],
    );
  }

  Widget _buildContext(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(screenContext);
    final double screenHeight = mediaQuery.size.height;
    final double screenTopPadding = mediaQuery.padding.top;
    final double maxHeight = screenHeight - screenTopPadding;

    final EdgeInsets windowPadding = EdgeInsets.fromViewPadding(
      View.of(context).viewInsets,
      View.of(context).devicePixelRatio,
    );

    return Container(
      padding: EdgeInsets.only(
        bottom: windowPadding.bottom > 0
            ? windowPadding.bottom
            : mediaQuery.padding.bottom,
      ),
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minHeight: (size == DSBottomSheetSize.LARGE) ? maxHeight : 0.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DSBottomSheetHeader(
            title: title ?? '',
            onDismiss: onDismiss,
          ),
          Flexible(
            child: _buildBody(context, child),
          ),
        ],
      ),
    );
  }

  EdgeInsets _buildPadding(BuildContext context) {
    return useDefaultPadding
        ? DSDeviceSpacer.getDeviceSpacer(context)
        : EdgeInsets.zero;
  }

  Widget _buildBody(BuildContext context, Widget child) {
    final EdgeInsets padding = _buildPadding(context);

    final Padding paddedChild = Padding(
      padding: padding,
      child: child,
    );

    return scrollEnabled
        ? SingleChildScrollView(
            child: paddedChild,
          )
        : paddedChild;
  }
}
