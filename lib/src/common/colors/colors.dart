import 'package:events_time_microapp_ds/src/common/colors/color_scale.dart';
import 'package:events_time_microapp_ds/src/common/colors/palette.dart';
import 'package:events_time_microapp_ds/src/common/themes/default_palette.dart';

mixin DSColors {
  static DSPalette current = defaultPalette;

  static DSColorScale get primary => current.primary;
  static DSColorScale get secondary => current.secondary;
  static DSColorScale get tertiary => current.tertiary;
  static DSNeutralScale get neutral => current.neutral;
  static DSColorScale get error => current.error;
  static DSColorScale get success => current.success;
  static DSColorScale get warning => current.warning;
  static DSColorScale get chart01 => current.chart01;
  static DSColorScale get chart02 => current.chart02;
  static DSColorScale get chart03 => current.chart03;
  static DSColorScale get chart04 => current.chart04;
}
