// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSConfirmDialog extends StatelessWidget with DSDialogShow {
  late DSConfirmDialogTheme confirmDialogTheme;
  final DSConfirmDialogTheme? theme;
  final DSDialogType? type;

  @override
  final BuildContext parentContext;

  final String title;
  final String? label;
  final String message;
  final String primaryButtonText;
  final Function() primaryOnPressed;
  final String secondaryButtonText;
  final Function() secondaryOnPressed;
  final bool hasIcon;
  final bool hasTopImage;

  @override
  Widget get self => this;

  DSConfirmDialog({
    super.key,
    this.theme,
    this.type,
    this.label,
    required this.parentContext,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    required this.primaryOnPressed,
    required this.secondaryButtonText,
    required this.secondaryOnPressed,
    this.hasIcon = true,
  }) : hasTopImage = false;

  DSConfirmDialog.withImage({
    super.key,
    this.theme,
    this.label,
    required this.parentContext,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    required this.primaryOnPressed,
    required this.secondaryButtonText,
    required this.secondaryOnPressed,
    this.hasTopImage = true,
  })  : type = null,
        hasIcon = false;

  DSConfirmDialogTheme? get themeFromType {
    if (type == null) return null;

    switch (type!) {
      case DSDialogType.SUCCESS:
        return confirmDialogThemeTypeSuccess;
      case DSDialogType.ERROR:
        return confirmDialogThemeTypeError;
      case DSDialogType.WARNING:
        return confirmDialogThemeTypeWarning;
      case DSDialogType.INFO:
        return confirmDialogThemeTypeInfo;
      case DSDialogType.TIME:
        return confirmDialogThemeTypeTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    confirmDialogTheme = confirmDialogThemeDefault;

    if (type != null) {
      confirmDialogTheme = confirmDialogTheme.copyWithOverride(themeFromType);
    }

    if (theme != null) {
      confirmDialogTheme = confirmDialogTheme.copyWithOverride(theme);
    }

    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: confirmDialogTheme.margin,
          padding: confirmDialogTheme.padding,
          decoration: BoxDecoration(
            color: confirmDialogTheme.backgroundColor,
            borderRadius: confirmDialogTheme.radius,
          ),
          child: DSFeedbackMessageActionDialog(
            title: title,
            message: message,
            label: label,
            icon: hasIcon ? confirmDialogTheme.icon : null,
            topImage: hasTopImage ? confirmDialogTheme.topImage : null,
            firstButtonAction: primaryOnPressed,
            firstButtonText: primaryButtonText,
            secondButtonAction: secondaryOnPressed,
            secondButtonText: secondaryButtonText,
            theme: DSFeedbackMessageTheme(
              iconColor: confirmDialogTheme.iconColor,
              iconBackgroundColor: confirmDialogTheme.iconBackgroundColor,
            ),
            type: DSFeedbackMessageActionDialogType.DOUBLE,
          ),
        ),
      ),
    );
  }
}
