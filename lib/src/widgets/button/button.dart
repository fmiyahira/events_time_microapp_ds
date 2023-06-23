import 'package:events_time_microapp_ds/src/widgets/button/button_theme.dart';
import 'package:events_time_microapp_ds/src/widgets/interactive_text/interactive_text.dart';
import 'package:events_time_microapp_ds/src/widgets/interactive_text/interactive_text_theme.dart';
import 'package:flutter/material.dart';

class DSButton extends StatefulWidget {
  final DSButtonSize size;
  final Function()? onPressed;
  final String text;
  final bool enabled;
  final FocusNode? focusNode;
  final DSButtonTheme? buttonTheme;
  final DSButtonStyle buttonStyle;

  const DSButton({
    super.key,
    required this.size,
    this.onPressed,
    required this.text,
    this.enabled = false,
    this.focusNode,
    this.buttonTheme,
    required this.buttonStyle,
  });

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool isPressed = false;
  late VoidCallback? handleOnPressed;
  late DSButtonTheme buttonTheme;

  @override
  void initState() {
    super.initState();

    _setHandleOnPressed();
    buttonTheme = buttonThemeDefault.copyWithOverride(themeFromStyle
        .copyWithOverride(widget.buttonTheme)
        .copyWithOverride(themeFromSize));
  }

  DSButtonTheme get themeFromSize {
    switch (widget.size) {
      case DSButtonSize.MICRO:
        return buttonThemeMicro;
      case DSButtonSize.SMALL:
        return buttonThemeSmall;
    }
  }

  DSButtonTheme get themeFromStyle {
    switch (widget.buttonStyle) {
      case DSButtonStyle.PRIMARY:
        return buttonThemePrimary;
      case DSButtonStyle.SECONDARY:
        return buttonThemeSecondary;
      case DSButtonStyle.OUTLINED:
        return buttonThemeOutlined;
      case DSButtonStyle.MILKED:
        return buttonThemeMilked;
      case DSButtonStyle.OUTLINED_MILKED:
        return buttonThemeOutlinedMilked;
      case DSButtonStyle.SECONDARY_MILKED:
        return buttonThemeSecondaryMilked;
      case DSButtonStyle.LINK:
        return buttonThemeLink;
    }
  }

  void handleHighlightChange(bool pressed) {
    isPressed = pressed;
    setState(() {});
  }

  void _setHandleOnPressed() {
    handleOnPressed = widget.enabled != false && widget.onPressed != null
        ? widget.onPressed
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          widget.buttonStyle == DSButtonStyle.LINK
              ? 0
              : buttonTheme.borderRadius!),
      child: Container(
        height: buttonTheme.minHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              widget.buttonStyle == DSButtonStyle.LINK
                  ? 0
                  : buttonTheme.borderRadius!),
          gradient: buttonTheme.color != null
              ? LinearGradient(colors: <Color>[
                  buttonTheme.color!,
                  buttonTheme.color!,
                ])
              : buttonTheme.gradientColor,
        ),
        child: MaterialButton(
          focusNode: widget.focusNode,
          disabledColor: buttonTheme.disabledColor,
          disabledTextColor: buttonTheme.disabledTextColor,
          elevation: 0,
          minWidth: buttonTheme.minWidth,
          height: buttonTheme.minHeight,
          highlightColor: buttonTheme.pressedColor,
          highlightElevation: 0,
          onPressed: handleOnPressed,
          onHighlightChanged: handleHighlightChange,
          padding: buttonTheme.padding,
          shape: !isPressed
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    width: buttonTheme.borderWidth!,
                    color: widget.enabled != true
                        ? buttonTheme.disabledBorderColor!
                        : buttonTheme.borderColor!,
                  ),
                  borderRadius: BorderRadius.circular(
                      widget.buttonStyle == DSButtonStyle.LINK
                          ? 0
                          : buttonTheme.borderRadius!),
                )
              : null,
          child: DSInteractiveText(
            text: widget.text,
            type: widget.size == DSButtonSize.MICRO
                ? DSInteractiveTextType.ACTION_SMALL
                : DSInteractiveTextType.ACTION,
            theme: DSInteractiveTextTheme(
              textColor: isPressed
                  ? buttonTheme.pressedTextColor
                  : (widget.enabled
                      ? buttonTheme.textColor
                      : buttonTheme.disabledTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
