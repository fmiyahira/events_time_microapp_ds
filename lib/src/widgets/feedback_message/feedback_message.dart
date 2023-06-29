// ignore_for_file: must_be_immutable

import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSFeedbackMessage extends StatelessWidget {
  late DSFeedbackMessageTheme feedbackMessageTheme;

  final DSFeedbackMessageTheme? theme;
  final DSFeedbackMessageStyle? style;
  final DSFeedbackMessageSize? size;
  final String title;
  final String? message;
  final String? label;
  final IconData? icon;
  final String? topImage;
  final String? buttonSmallText;
  final Function()? buttonSmallAction;

  DSFeedbackMessage({
    super.key,
    this.theme,
    this.style,
    this.size,
    this.icon,
    this.topImage,
    this.label,
    this.buttonSmallAction,
    this.buttonSmallText,
    required this.title,
    this.message,
  }) : assert(icon == null || topImage == null,
            '[icon] e [topImage] não podem ser utilizados em conjunto');

  DSFeedbackMessageTheme? get themeFromStyle {
    if (style == null) return null;

    switch (style!) {
      case DSFeedbackMessageStyle.MILKED:
        return feedbackMessageThemeStyleMilked;
    }
  }

  @override
  Widget build(BuildContext context) {
    feedbackMessageTheme = feedbackMessageThemeDefault.copyWithOverride(theme);

    if (size == DSFeedbackMessageSize.LARGE || size == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...topImage != null ? _buildImage() : _buildIcon(),
          DSText(
            title,
            type: size == DSFeedbackMessageSize.LARGE
                ? DSTextType.HEADING3
                : DSTextType.HEADING4,
            theme: DSTextTheme(
              textColor: feedbackMessageTheme.textColor,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: kComponentSpacerS),
          DSText(
            message ?? '',
            theme: DSTextTheme(
              textColor: feedbackMessageTheme.textColor,
              textAlign: TextAlign.center,
            ),
            type: DSTextType.BODY_SMALL,
          ),
          if (label != null)
            Column(
              children: <Widget>[
                const SizedBox(height: kComponentSpacerS),
                DSText(
                  label!,
                  type: DSTextType.BODY_SMALL,
                  theme: DSTextTheme(
                    textColor: DSColors.neutral.s46,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
        ],
      );
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: feedbackMessageTheme.iconColor,
              size: kComponentSpacerL,
            ),
            const SizedBox(width: kComponentSpacerS),
            LimitedBox(
              maxWidth: MediaQuery.of(context).size.width * 0.60,
              child: DSText(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                type: DSTextType.HEADING4,
                theme: const DSTextTheme(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: kLayoutSpacerXS),
            Expanded(
              child: Visibility(
                visible: buttonSmallText != null,
                child: LimitedBox(
                  maxHeight: 23,
                  child: GestureDetector(
                    onTap: buttonSmallAction ?? () => <void>{},
                    child: DSText(
                      buttonSmallText ?? '',
                      style: style == DSFeedbackMessageStyle.MILKED
                          ? DSTextStyle.MILKED
                          : null,
                      type: DSTextType.HEADING4,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      theme: DSTextTheme(
                        fontSize: 16,
                        textColor: DSColors.primary.base,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: kComponentSpacerS),
        Row(
          children: <Widget>[
            Expanded(
              child: DSText(
                message ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                type: DSTextType.BODY_SMALL,
                theme: const DSTextTheme(fontSize: 14),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<Widget> _buildIcon() {
    return icon == null
        ? <Widget>[]
        : <Widget>[
            DSJumboIcon(
              icon,
              theme: DSJumboIconTheme(
                iconColor: feedbackMessageTheme.iconColor,
                backgroundColor: feedbackMessageTheme.iconBackgroundColor,
              ),
              size: size == DSFeedbackMessageSize.LARGE
                  ? DSJumboIconSize.LARGE
                  : null,
            ),
            const SizedBox(height: kComponentSpacerL),
          ];
  }

  List<Widget> _buildImage() {
    return topImage == null
        ? <Widget>[]
        : <Widget>[
            DSAssets.render(
              topImage ?? '',
              height: feedbackMessageTheme.imageHeight,
            ),
            const SizedBox(height: kComponentSpacerL),
          ];
  }
}
