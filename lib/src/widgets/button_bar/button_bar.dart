import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:flutter/material.dart';

class DSButtonBar extends StatelessWidget {
  final bool primaryButtonEnabled;
  final String primaryButtonText;
  final Function()? primaryOnPressed;
  final String? secondaryButtonText;
  final Function()? secondaryOnPressed;
  final String? value;
  final String? caption;

  const DSButtonBar({
    super.key,
    this.primaryButtonEnabled = true,
    required this.primaryButtonText,
    required this.primaryOnPressed,
  })  : secondaryButtonText = null,
        secondaryOnPressed = null,
        value = null,
        caption = null;

  const DSButtonBar.withTwoButtons({
    super.key,
    this.primaryButtonEnabled = true,
    required this.primaryButtonText,
    required this.primaryOnPressed,
    required this.secondaryButtonText,
    required this.secondaryOnPressed,
  })  : value = null,
        caption = null;

  const DSButtonBar.withText({
    super.key,
    this.primaryButtonEnabled = true,
    required this.primaryButtonText,
    required this.primaryOnPressed,
    required this.value,
    required this.caption,
  })  : secondaryButtonText = null,
        secondaryOnPressed = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: DSColors.neutral.s100,
        border: Border(
          top: BorderSide(
            color: DSColors.neutral.s88,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: DSColors.neutral.s88,
            spreadRadius: -4,
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          ..._buildSecondaryButton(),
          ..._buildTexts(),
          Expanded(
            child: DSButton(
              size: DSButtonSize.SMALL,
              enabled: primaryButtonEnabled,
              text: primaryButtonText,
              onPressed: primaryOnPressed,
              buttonStyle: DSButtonStyle.PRIMARY,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSecondaryButton() {
    final List<Widget> widgets = <Widget>[];

    secondaryButtonText.let((String it) => widgets.add(Expanded(
            child: DSButton(
          size: DSButtonSize.SMALL,
          buttonStyle: DSButtonStyle.SECONDARY,
          text: secondaryButtonText ?? '',
          onPressed: secondaryOnPressed,
        ))));

    secondaryButtonText.let((String it) => widgets.add(
          const SizedBox(
            width: kComponentSpacerS,
          ),
        ));

    return widgets;
  }

  List<Widget> _buildTexts() {
    final List<Widget> widgets = <Widget>[];

    final String? captionValue = caption;
    final String? dataValue = value;

    if (captionValue != null && dataValue != null) {
      widgets.addAll(<Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DSText(
                captionValue,
                type: DSTextType.BODY_CAPTION,
              ),
              DSText(
                dataValue,
                type: DSTextType.NUMBER,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: kComponentSpacerXXL,
          width: kComponentSpacerXXL,
        ),
      ]);
    }

    return widgets;
  }
}
