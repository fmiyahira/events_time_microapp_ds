// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/src/common/colors/all.dart';
import 'package:flutter/material.dart';

import '../../common/constants/all.dart';

enum DSAccordionType { LEAN }

class DSAccordionTheme {
  Color? iconColor;
  double? iconSize;
  Color? borderColor;
  double? borderWidth;
  EdgeInsets? padding;
  EdgeInsetsGeometry? contentPadding;

  DSAccordionTheme({
    this.iconColor,
    this.iconSize,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.contentPadding,
  });

  DSAccordionTheme copyWithOverride(DSAccordionTheme? accordionThemeOverride) {
    return DSAccordionTheme(
      iconColor: accordionThemeOverride?.iconColor ?? iconColor,
      iconSize: accordionThemeOverride?.iconSize ?? iconSize,
      borderColor: accordionThemeOverride?.borderColor ?? borderColor,
      borderWidth: accordionThemeOverride?.borderWidth ?? borderWidth,
      padding: accordionThemeOverride?.padding ?? padding,
      contentPadding: accordionThemeOverride?.contentPadding ?? contentPadding,
    );
  }
}

final DSAccordionTheme accordionThemeDefault = DSAccordionTheme(
  iconColor: DSColors.neutral.s46,
  iconSize: 16.0,
  borderColor: DSColors.neutral.s88,
  borderWidth: 1.0,
  padding: const EdgeInsets.symmetric(vertical: 24.0),
  contentPadding: const EdgeInsets.only(top: kComponentSpacerL),
);
