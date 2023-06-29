import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSFeedbackMessageActionType { LINK, OUTLINED }

class DSFeedbackMessageAction extends StatelessWidget {
  final DSFeedbackMessageTheme? theme;
  final DSFeedbackMessageStyle? style;
  final DSFeedbackMessageActionType? type;
  final IconData? icon;
  final String title;
  final String message;
  final String buttonText;
  final Function()? buttonAction;

  const DSFeedbackMessageAction({
    super.key,
    this.theme,
    this.style,
    this.type = DSFeedbackMessageActionType.LINK,
    this.icon,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DSFeedbackMessage(
          theme: theme,
          style: style,
          icon: icon,
          title: title,
          message: message,
        ),
        const SizedBox(height: kComponentSpacerXL),
        if (type == DSFeedbackMessageActionType.LINK)
          DSLinkButton(
            text: buttonText,
            onPressed: buttonAction ?? () => <void>{},
            style: style == DSFeedbackMessageStyle.MILKED
                ? DSLinkButtonStyle.MILKED
                : null,
          )
        else
          DSButton(
            text: buttonText,
            onPressed: buttonAction ?? () => <void>{},
            buttonStyle: style == DSFeedbackMessageStyle.MILKED
                ? DSButtonStyle.OUTLINED_MILKED
                : DSButtonStyle.OUTLINED,
            size: DSButtonSize.SMALL,
          )
      ],
    );
  }
}
