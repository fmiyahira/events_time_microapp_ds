// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSTextFieldStyle { MILKED }

enum DSTextFieldType { PASSWORD, FILTER }

class DSTextFieldTheme {
  final EdgeInsets? padding;
  final Color? color;
  final Color? errorColor;
  final Color? textErrorColor;
  final Color? textDisabledColor;
  final Color? iconColor;
  final Color? iconErrorColor;
  final Color? cursorColor;
  final Color? labelColor;
  final Color? labelFocusedColor;
  final Color? labelErrorColor;
  final Color? inputDisabledColor;

  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;

  final DSTextTheme? labelTextTheme;
  final DSTextTheme? alertTextTheme;
  final DSTextTheme? inputTextTheme;
  final DSTextTheme? helperTextTheme;

  DSTextFieldTheme({
    this.padding,
    this.color,
    this.errorColor,
    this.textErrorColor,
    this.textDisabledColor,
    this.iconColor,
    this.iconErrorColor,
    this.cursorColor,
    this.labelColor,
    this.labelFocusedColor,
    this.labelErrorColor,
    this.inputDisabledColor,
    this.border,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.labelTextTheme,
    this.alertTextTheme,
    this.inputTextTheme,
    this.helperTextTheme,
  });

  DSTextFieldTheme copyWithOverride(DSTextFieldTheme? themeOverride) {
    return DSTextFieldTheme(
      padding: themeOverride?.padding ?? padding,
      color: themeOverride?.color ?? color,
      errorColor: themeOverride?.errorColor ?? errorColor,
      textErrorColor: themeOverride?.textErrorColor ?? textErrorColor,
      textDisabledColor: themeOverride?.textDisabledColor ?? textDisabledColor,
      iconColor: themeOverride?.iconColor ?? iconColor,
      iconErrorColor: themeOverride?.iconErrorColor ?? iconErrorColor,
      cursorColor: themeOverride?.cursorColor ?? cursorColor,
      labelColor: themeOverride?.labelColor ?? labelColor,
      labelFocusedColor: themeOverride?.labelFocusedColor ?? labelFocusedColor,
      labelErrorColor: themeOverride?.labelErrorColor ?? labelErrorColor,
      inputDisabledColor:
          themeOverride?.inputDisabledColor ?? inputDisabledColor,
      border: themeOverride?.border ?? border,
      focusedBorder: themeOverride?.focusedBorder ?? focusedBorder,
      focusedErrorBorder:
          themeOverride?.focusedErrorBorder ?? focusedErrorBorder,
      labelTextTheme: themeOverride?.labelTextTheme ?? labelTextTheme,
      alertTextTheme: themeOverride?.alertTextTheme ?? alertTextTheme,
      inputTextTheme: themeOverride?.inputTextTheme ?? inputTextTheme,
      helperTextTheme: themeOverride?.helperTextTheme ?? helperTextTheme,
    );
  }
}

final DSTextFieldTheme textFieldThemeDefault = DSTextFieldTheme(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  color: DSColors.neutral.s96,
  errorColor: DSColors.error.lighter,
  iconColor: DSColors.neutral.s24,
  cursorColor: DSColors.primary.base,
  labelColor: DSColors.neutral.s46,
  labelFocusedColor: DSColors.primary.base,
  labelErrorColor: DSColors.error.base,
  border: UnderlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: DSColors.primary.base),
    borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: DSColors.error.base),
    borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
  ),
  inputTextTheme: textThemeDefault.copyWithOverride(textThemeTypeInput),
  labelTextTheme: textThemeDefault.copyWithOverride(textThemeTypeLabelSmall),
  alertTextTheme: textThemeDefault
      .copyWithOverride(textThemeTypeLabelSmall)
      .copyWithOverride(textThemeStyleError),
  helperTextTheme: textThemeDefault.copyWithOverride(textThemeTypeLabelSmall),
);

final DSTextFieldTheme textFieldThemeStyleMilked = DSTextFieldTheme(
  labelTextTheme: textThemeDefault.copyWithOverride(textThemeStyleMilked),
  textErrorColor: DSColors.error.darker,
  cursorColor: DSColors.neutral.s100,
  color: DSColors.neutral.s24.withOpacity(0.16),
  labelColor: DSColors.neutral.s100,
  iconColor: DSColors.neutral.s100,
  iconErrorColor: DSColors.neutral.s24,
  labelFocusedColor: DSColors.neutral.s96,
  inputDisabledColor: DSColors.neutral.s24.withOpacity(0.12),
  textDisabledColor: DSColors.neutral.s100.withOpacity(0.24),
  inputTextTheme: textThemeDefault
      .copyWithOverride(textThemeStyleMilked)
      .copyWithOverride(textThemeTypeInput),
  alertTextTheme: textThemeDefault
      .copyWithOverride(textThemeStyleMilked)
      .copyWithOverride(textThemeTypeLabelSmall),
  helperTextTheme: textThemeDefault
      .copyWithOverride(textThemeStyleMilked)
      .copyWithOverride(textThemeTypeLabelSmall),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: DSColors.neutral.s100),
    borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
  ),
);
