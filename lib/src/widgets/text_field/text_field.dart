import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/text_font_factor_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DSTextField extends StatefulWidget {
  final DSTextFieldTheme? theme;
  final DSTextFieldStyle? style;
  final DSTextFieldType? type;
  final String? initialValue;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final int? maxLength;
  final int? maxLines;
  final bool enabled;
  final bool readOnly;
  final bool autovalidate;
  final bool hideCounter;
  final bool isDense;
  final String? errorText;
  final String? helperText;
  final int errorMaxLines;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  final DSTextTheme? helperTextTheme;

  const DSTextField({
    super.key,
    this.theme,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.helperTextTheme,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.controller,
    this.style,
    this.type,
    this.initialValue,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.obscure = false,
    this.autovalidate = true,
    this.hideCounter = false,
    this.isDense = false,
    this.errorText,
    this.helperText,
    this.errorMaxLines = 1,
    this.autofocus = false,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.onEditingComplete,
  });

  @override
  State<DSTextField> createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  late DSTextFieldTheme textFieldTheme;
  String? value;
  late bool hasError;
  late bool hidePassword;
  late FocusNode focusNode;
  late TextEditingController controller;

  void _builderTheme() {
    textFieldTheme = textFieldThemeDefault;

    if (widget.style != null) {
      textFieldTheme =
          textFieldTheme.copyWithOverride(textFieldThemeStyleMilked);
    }

    if (widget.theme != null) {
      textFieldTheme = textFieldTheme.copyWithOverride(widget.theme);
    }
  }

  @override
  void initState() {
    super.initState();

    value = widget.initialValue;
    hasError = false;
    hidePassword = true;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(_onFocusNodeEvent);
    controller = widget.controller ?? TextEditingController(text: value);

    _builderTheme();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }

    if (widget.controller == null) {
      controller.dispose();
    }

    super.dispose();
  }

  void _onFocusNodeEvent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _validateError();
    _builderTheme();

    final double currentFontScale = MediaQuery.of(context).textScaleFactor;

    return TextFormField(
      textAlign: widget.textAlign!,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autovalidateMode: widget.autovalidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      autofocus: widget.autofocus,
      focusNode: focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      onEditingComplete: widget.onEditingComplete,
      controller: controller,
      obscureText: widget.obscure == true ||
          (hidePassword && widget.type == DSTextFieldType.PASSWORD),
      style: _buildInputStyle(currentFontScale),
      cursorColor:
          hasError ? textFieldTheme.textErrorColor : textFieldTheme.cursorColor,
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: _buildLabelStyle(currentFontScale),
          errorText: hasError ? (widget.errorText) : null,
          errorStyle: _buildErrorStyle(currentFontScale,
              textFieldTheme.padding == const EdgeInsets.all(0)),
          helperText: widget.helperText,
          helperStyle: _buildHelperStyle(currentFontScale),
          errorMaxLines: widget.errorMaxLines,
          prefixIcon: widget.prefixIcon ?? _buildPrefixIcon(),
          suffixIcon: widget.suffixIcon ?? _buildSuffixIcon(),
          isDense: widget.isDense,
          contentPadding: textFieldTheme.padding,
          filled: true,
          fillColor: _getFillColor(),
          border: textFieldTheme.border,
          focusedBorder: textFieldTheme.focusedBorder,
          focusedErrorBorder: textFieldTheme.focusedErrorBorder,
          counter: widget.hideCounter ? const Offstage() : null,
          suffixIconColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.focused)
                      ? textFieldTheme.iconColor!
                      : Colors.grey),
          prefixIconColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.focused)
                      ? Colors.grey
                      : textFieldTheme.iconColor!)),
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      onChanged: _onChange,
    );
  }

  Color? _getFillColor() {
    return widget.enabled
        ? (hasError ? textFieldTheme.errorColor : textFieldTheme.color)
        : textFieldTheme.inputDisabledColor;
  }

  void _validateError() {
    final bool hasErrorValue = widget.errorText != null;
    final bool hasErrorValidation;

    if (widget.validator != null) {
      hasErrorValidation = widget.validator?.call(value ?? '') != null;
    } else {
      hasErrorValidation = false;
    }

    setState(() {
      hasError = hasErrorValue || hasErrorValidation;
    });
  }

  void _onChange(String valueParam) {
    setState(() {
      value = valueParam;
    });
    widget.onChanged?.call(valueParam);
  }

  Widget? _buildPrefixIcon() {
    if (widget.type != DSTextFieldType.FILTER) {
      return null;
    }

    return DSIconButton(
      icon: Icons.search,
      theme: DSIconButtonTheme(
        iconColor:
            hasError ? textFieldTheme.iconErrorColor : textFieldTheme.iconColor,
      ),
      onPressed: () => <void>{},
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.type != DSTextFieldType.PASSWORD) {
      return null;
    }

    return DSIconButton(
      icon: hidePassword ? Icons.visibility : Icons.visibility_off,
      theme: DSIconButtonTheme(
        iconColor:
            hasError ? textFieldTheme.iconErrorColor : textFieldTheme.iconColor,
      ),
      onPressed: () => setState(() {
        hidePassword = !hidePassword;
      }),
    );
  }

  TextStyle _buildLabelStyle(double currentFontScale) {
    final DSTextTheme labelTheme = textFieldTheme.labelTextTheme!;

    return TextStyle(
      color: widget.enabled
          ? hasError
              ? textFieldTheme.labelErrorColor
              : (focusNode.hasFocus
                  ? textFieldTheme.labelFocusedColor
                  : textFieldTheme.labelColor)
          : textFieldTheme.textDisabledColor,
      fontSize: labelTheme.fontSize != null
          ? (labelTheme.fontSize)! /
              currentFontScale *
              TextFontScaleCalculator.call(labelTheme.fontSize!, context)
          : null,
      fontWeight: labelTheme.fontWeight,
      fontStyle: labelTheme.fontStyle,
      letterSpacing: labelTheme.letterSpacing,
      height: labelTheme.lineHeight,
    );
  }

  TextStyle _buildInputStyle(double currentFontScale) {
    return TextStyle(
        color: widget.enabled
            ? (hasError
                ? textFieldTheme.textErrorColor
                : textFieldTheme.inputTextTheme!.textColor)
            : (textFieldTheme.textDisabledColor ??
                textFieldTheme.inputTextTheme!.textColor),
        fontSize: textFieldTheme.inputTextTheme!.fontSize != null
            ? textFieldTheme.inputTextTheme!.fontSize! /
                currentFontScale *
                TextFontScaleCalculator.call(
                    textFieldTheme.inputTextTheme!.fontSize!, context)
            : null,
        fontWeight: textFieldTheme.inputTextTheme!.fontWeight,
        fontStyle: textFieldTheme.inputTextTheme!.fontStyle,
        letterSpacing: textFieldTheme.inputTextTheme!.letterSpacing,
        height: textFieldTheme.inputTextTheme!.lineHeight,
        decoration: TextDecoration.none,
        decorationColor: DSColors.neutral.s100);
  }

  TextStyle _buildHelperStyle(double currentFontScale) {
    return TextStyle(
      color: textFieldTheme.helperTextTheme!.textColor,
      fontSize: textFieldTheme.helperTextTheme!.fontSize != null
          ? textFieldTheme.helperTextTheme!.fontSize! /
              currentFontScale *
              TextFontScaleCalculator.call(
                  textFieldTheme.helperTextTheme!.fontSize!, context)
          : null,
      fontWeight: textFieldTheme.helperTextTheme!.fontWeight,
      fontStyle: textFieldTheme.helperTextTheme!.fontStyle,
      letterSpacing: textFieldTheme.helperTextTheme!.letterSpacing,
      height: textFieldTheme.helperTextTheme!.lineHeight,
    );
  }

  TextStyle _buildErrorStyle(double currentFontScale, bool isCodeField) {
    return TextStyle(
      color: textFieldTheme.alertTextTheme!.textColor,
      fontSize: textFieldTheme.alertTextTheme!.fontSize != null
          ? textFieldTheme.alertTextTheme!.fontSize! /
              currentFontScale *
              TextFontScaleCalculator.call(
                  textFieldTheme.alertTextTheme!.fontSize!, context)
          : null,
      fontWeight: textFieldTheme.alertTextTheme!.fontWeight,
      fontStyle: textFieldTheme.alertTextTheme!.fontStyle,
      letterSpacing: textFieldTheme.alertTextTheme!.letterSpacing,
      height: isCodeField ? 0 : textFieldTheme.alertTextTheme!.lineHeight,
    );
  }
}
