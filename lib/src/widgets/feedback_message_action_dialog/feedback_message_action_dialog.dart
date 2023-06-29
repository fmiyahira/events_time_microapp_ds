import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSFeedbackMessageActionDialogType { SINGLE, DOUBLE }

class DSFeedbackMessageActionDialog extends StatelessWidget {
  final DSFeedbackMessageTheme? theme;
  final DSFeedbackMessageStyle? style;
  final DSFeedbackMessageSize? size;
  final DSFeedbackMessageActionDialogType? type;
  final IconData? icon;
  final String? topImage;
  final String title;
  final String message;
  final String? label;
  final Function() firstButtonAction;
  final String firstButtonText;
  final Function()? secondButtonAction;
  final String? secondButtonText;

  const DSFeedbackMessageActionDialog({
    super.key,
    this.theme,
    this.style,
    this.size,
    this.type = DSFeedbackMessageActionDialogType.SINGLE,
    this.icon,
    this.topImage,
    this.label,
    required this.title,
    required this.message,
    required this.firstButtonAction,
    required this.firstButtonText,
    this.secondButtonAction,
    this.secondButtonText,
  }) : assert(icon == null || topImage == null,
            '[icon] e [topImage] não podem ser utilizados em conjunto');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DSFeedbackMessage(
          theme: theme,
          title: title,
          style: style,
          size: size,
          icon: icon,
          topImage: topImage,
          label: label,
          message: message,
        ),
        const SizedBox(height: kComponentSpacerXXL),
        DSButton(
          text: firstButtonText,
          onPressed: firstButtonAction,
          size: DSButtonSize.SMALL,
          buttonStyle: style == DSFeedbackMessageStyle.MILKED
              ? DSButtonStyle.MILKED
              : DSButtonStyle.PRIMARY,
        ),
        if (type == DSFeedbackMessageActionDialogType.DOUBLE &&
            secondButtonText != null)
          DSLinkButton(
            text: secondButtonText!,
            onPressed: secondButtonAction,
            style: style == DSFeedbackMessageStyle.MILKED
                ? DSLinkButtonStyle.MILKED
                : null,
          ),
      ],
    );
  }
}
