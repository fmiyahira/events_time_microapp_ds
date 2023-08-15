import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:flutter/material.dart';

class DSPhaseButton extends StatefulWidget {
  final DSPhaseButtonTheme? theme;
  final DSPhaseButtonStyle? style;
  final DSPhaseButtonSize? size;
  final DSPhaseButtonState state;
  final String text;
  final Function onPressed;
  final bool enabled;
  final bool disableAfterSuccess;
  final bool disableAfterError;
  final bool disableWhenDone;

  const DSPhaseButton({
    super.key,
    this.theme,
    this.style,
    this.size,
    this.state = DSPhaseButtonState.INITIAL,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.disableAfterSuccess = false,
    this.disableAfterError = false,
    this.disableWhenDone = false,
  });

  @override
  State<DSPhaseButton> createState() => _DSPhaseButtonState();
}

class _DSPhaseButtonState extends State<DSPhaseButton> {
  late DSPhaseButtonTheme phaseButtonTheme;
  DSPhaseButtonTheme? theme;
  bool isPressed = false;
  bool showPhase = false;

  DSPhaseButtonTheme? get themeFromStyle {
    if (widget.style == null) return null;

    switch (widget.style!) {
      case DSPhaseButtonStyle.MILKED:
        return phaseButtonThemeStyleMilked;
    }
  }

  DSPhaseButtonTheme? get themeFromSize {
    if (widget.size == null) return null;

    switch (widget.size!) {
      case DSPhaseButtonSize.SMALL:
        return phaseButtonThemeStyleSmall;
    }
  }

  void _builderTheme() {
    phaseButtonTheme = phaseButtonThemeDefault;

    if (widget.size != null) {
      phaseButtonTheme = phaseButtonTheme.copyWithOverride(themeFromSize);
    }

    if (widget.style != null) {
      phaseButtonTheme = phaseButtonTheme.copyWithOverride(themeFromStyle);
    }

    if (widget.theme != null) {
      phaseButtonTheme = phaseButtonTheme.copyWithOverride(widget.theme);
    }
  }

  @override
  void initState() {
    super.initState();
    _builderTheme();
  }

  @override
  void didUpdateWidget(covariant DSPhaseButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    _builderTheme();
  }

  void handleHighligthChange(bool pressed) {
    setState(() {
      isPressed = pressed;
    });
  }

  List<Widget> getChildren(DSPhaseButtonTheme theme) {
    final DSPhaseButtonTheme baseTheme = phaseButtonThemeDefault;

    final Color textColor = isPressed
        ? theme.pressedTextColor.orElse(baseTheme.pressedTextColor)
        : getEffectiveTextColor(
            state: widget.state,
            theme: theme,
            defaultColor: widget.enabled
                ? theme.textColor.orElse(baseTheme.textColor)
                : theme.disabledTextColor.orElse(baseTheme.disabledTextColor));

    List<Widget> children = <Widget>[];

    if (widget.state == DSPhaseButtonState.IN_PROGRESS) {
      children = <Widget>[
        SizedBox(
          height: kLayoutSpacerS,
          width: kLayoutSpacerS,
          child: CircularProgressIndicator(
            backgroundColor: theme.indicatorBackgroundColor,
            strokeWidth: theme.strokeWidth.orElse(baseTheme.strokeWidth),
            valueColor: AlwaysStoppedAnimation<Color>(
                theme.indicatorColor.orElse(baseTheme.indicatorColor)),
          ),
        ),
      ];
    } else if (widget.state == DSPhaseButtonState.DONE_WITH_SUCCESS) {
      children.add(
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.check,
            color: textColor,
          ),
        ),
      );
    } else if (widget.state == DSPhaseButtonState.DONE_WITH_ERROR) {
      children.add(
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.error_outline,
            color: textColor,
          ),
        ),
      );
    }

    if (widget.state != DSPhaseButtonState.IN_PROGRESS) {
      children.add(
        DSInteractiveText(
          text: widget.text,
          theme: DSInteractiveTextTheme(
            textColor: textColor,
          ),
          type: widget.size == DSPhaseButtonSize.SMALL
              ? DSInteractiveTextType.ACTION_SMALL
              : DSInteractiveTextType.ACTION,
        ),
      );
    }

    return children;
  }

  LinearGradient getLinearEffectiveColor({
    required DSPhaseButtonState state,
    required DSPhaseButtonTheme theme,
    required LinearGradient defaultColor,
  }) {
    final DSPhaseButtonTheme baseTheme = phaseButtonThemeDefault;

    if (state == DSPhaseButtonState.IN_PROGRESS) {
      return LinearGradient(colors: <Color>[
        theme.inProgressColor.orElse(baseTheme.inProgressColor),
        theme.inProgressColor.orElse(baseTheme.inProgressColor),
      ]);
    } else if (state == DSPhaseButtonState.DONE_WITH_SUCCESS) {
      return LinearGradient(colors: <Color>[
        theme.successColor.orElse(baseTheme.successColor),
        theme.successColor.orElse(baseTheme.successColor),
      ]);
    } else if (state == DSPhaseButtonState.DONE_WITH_ERROR) {
      return LinearGradient(colors: <Color>[
        theme.errorColor.orElse(baseTheme.errorColor),
        theme.errorColor.orElse(baseTheme.errorColor),
      ]);
    } else {
      return defaultColor;
    }
  }

  Color getEffectiveColor({
    required DSPhaseButtonState state,
    required DSPhaseButtonTheme theme,
    required Color defaultColor,
  }) {
    final DSPhaseButtonTheme baseTheme = phaseButtonThemeDefault;

    if (state == DSPhaseButtonState.IN_PROGRESS) {
      return theme.inProgressColor.orElse(baseTheme.inProgressColor);
    } else if (state == DSPhaseButtonState.DONE_WITH_SUCCESS) {
      return theme.successColor.orElse(baseTheme.successColor);
    } else if (state == DSPhaseButtonState.DONE_WITH_ERROR) {
      return theme.errorColor.orElse(baseTheme.errorColor);
    } else {
      return defaultColor;
    }
  }

  Color getEffectiveTextColor({
    required DSPhaseButtonState state,
    required DSPhaseButtonTheme theme,
    required Color defaultColor,
  }) {
    final DSPhaseButtonTheme baseTheme = phaseButtonThemeDefault;

    if (state == DSPhaseButtonState.DONE_WITH_SUCCESS) {
      return theme.successTextColor.orElse(baseTheme.successTextColor);
    } else if (state == DSPhaseButtonState.DONE_WITH_ERROR) {
      return theme.errorTextColor.orElse(baseTheme.errorTextColor);
    } else {
      return defaultColor;
    }
  }

  void _onPressed() {
    if ((widget.state == DSPhaseButtonState.IN_PROGRESS) ||
        (widget.disableWhenDone &&
            <DSPhaseButtonState>[
              DSPhaseButtonState.DONE_WITH_SUCCESS,
              DSPhaseButtonState.DONE_WITH_ERROR,
            ].contains(widget.state)) ||
        (widget.disableAfterSuccess &&
            widget.state == DSPhaseButtonState.DONE_WITH_SUCCESS) ||
        (widget.disableAfterError &&
            widget.state == DSPhaseButtonState.DONE_WITH_ERROR)) {
      return;
    } else if (widget.enabled) {
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(phaseButtonTheme.borderRadius!),
        gradient: getLinearEffectiveColor(
          state: widget.state,
          theme: phaseButtonTheme,
          defaultColor: phaseButtonTheme.color != null
              ? LinearGradient(colors: <Color>[
                  phaseButtonTheme.color!,
                  phaseButtonTheme.color!
                ])
              : phaseButtonTheme.gradientColor
                  .orElse(phaseButtonTheme.gradientColor),
        ),
      ),
      child: MaterialButton(
        disabledColor: getEffectiveColor(
          state: widget.state,
          theme: phaseButtonTheme,
          defaultColor: phaseButtonTheme.disabledColor
              .orElse(phaseButtonTheme.disabledTextColor),
        ),
        disabledTextColor: phaseButtonTheme.disabledTextColor,
        elevation: 0,
        height: phaseButtonTheme.minHeight,
        highlightColor: phaseButtonTheme.pressedColor,
        highlightElevation: 0,
        minWidth: phaseButtonTheme.minWidth,
        onPressed: widget.enabled ? _onPressed : null,
        onHighlightChanged: handleHighligthChange,
        padding: phaseButtonTheme.padding,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            width: phaseButtonTheme.borderWidth!,
            color: widget.enabled != true
                ? phaseButtonTheme.disabledBorderColor!
                : phaseButtonTheme.borderColor!,
          ),
          borderRadius: BorderRadius.circular(phaseButtonTheme.borderRadius!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(phaseButtonTheme),
        ),
      ),
    );
  }
}
