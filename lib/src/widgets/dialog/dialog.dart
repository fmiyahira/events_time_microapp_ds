// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSDialog extends StatelessWidget with DSDialogShow {
  late DSDialogTheme dialogTheme;

  final DSDialogTheme? theme;
  final DSDialogType? type;

  @override
  final BuildContext parentContext;

  final String title;
  final String message;
  final String? label;
  final String buttonText;
  final Function() buttonOnPressed;
  final bool hasIcon;
  final bool hasTopImage;

  @override
  Widget get self => this;

  DSDialog({
    super.key,
    this.theme,
    this.type,
    required this.parentContext,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.buttonOnPressed,
    this.label,
    this.hasIcon = true,
  }) : hasTopImage = false;

  DSDialog.withImage({
    super.key,
    this.theme,
    required this.parentContext,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.buttonOnPressed,
    this.label,
    this.hasTopImage = true,
  })  : type = null,
        hasIcon = false;

  DSDialogTheme? get themeFromType {
    if (type == null) return null;

    switch (type!) {
      case DSDialogType.SUCCESS:
        return dialogThemeTypeSuccess;
      case DSDialogType.WARNING:
        return dialogThemeTypeWarning;
      case DSDialogType.ERROR:
        return dialogThemeTypeError;
      case DSDialogType.INFO:
        return dialogThemeTypeInfo;
      case DSDialogType.TIME:
        return dialogThemeTypeTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    dialogTheme = dialogThemeDefault;

    if (themeFromType != null) {
      dialogTheme = dialogTheme.copyWithOverride(themeFromType);
    }

    if (theme != null) {
      dialogTheme = dialogTheme.copyWithOverride(theme);
    }

    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: dialogTheme.margin,
          padding: dialogTheme.padding,
          decoration: BoxDecoration(
            color: dialogTheme.backgroundColor,
            borderRadius: dialogTheme.radius,
          ),
          child: DSFeedbackMessageActionDialog(
            title: title,
            message: message,
            icon: hasIcon ? dialogTheme.icon : null,
            topImage: hasTopImage ? dialogTheme.topImage : null,
            firstButtonAction: buttonOnPressed,
            firstButtonText: buttonText,
            theme: DSFeedbackMessageTheme(
              iconColor: dialogTheme.iconColor,
              iconBackgroundColor: dialogTheme.iconBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}

mixin DSDialogShow {
  BuildContext get parentContext;
  Widget? get self;

  Future<dynamic> show(
      {bool dismissible = true, bool useRootNavigator = true}) async {
    return Future<void>.microtask(() async {
      try {
        return await showDialog(
          barrierDismissible: dismissible,
          context: parentContext,
          useRootNavigator: useRootNavigator,
          builder: (BuildContext context) {
            return WillPopScope(
              child: self ?? Container(),
              onWillPop: () => Future<bool>.value(dismissible),
            );
          },
        );
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
