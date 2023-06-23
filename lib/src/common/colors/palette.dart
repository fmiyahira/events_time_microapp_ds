// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/src/common/colors/color_scale.dart';

class DSPalette {
  // main colors
  final DSColorScale primary;
  final DSColorScale secondary;
  final DSColorScale tertiary;

  // status colors
  final DSColorScale error;
  final DSColorScale success;
  final DSColorScale warning;

  // support colors
  final DSColorScale chart01;
  final DSColorScale chart02;
  final DSColorScale chart03;
  final DSColorScale chart04;

  // neutral colors
  final DSNeutralScale neutral;

  DSPalette({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.success,
    required this.warning,
    required this.chart01,
    required this.chart02,
    required this.chart03,
    required this.chart04,
    required this.neutral,
  });

  DSPalette copyWith({
    DSColorScale? primary,
    DSColorScale? secondary,
    DSColorScale? tertiary,
    DSColorScale? error,
    DSColorScale? success,
    DSColorScale? warning,
    DSColorScale? chart01,
    DSColorScale? chart02,
    DSColorScale? chart03,
    DSColorScale? chart04,
    DSNeutralScale? neutral,
  }) {
    return DSPalette(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      chart01: chart01 ?? this.chart01,
      chart02: chart02 ?? this.chart02,
      chart03: chart03 ?? this.chart03,
      chart04: chart04 ?? this.chart04,
      neutral: neutral ?? this.neutral,
    );
  }
}
