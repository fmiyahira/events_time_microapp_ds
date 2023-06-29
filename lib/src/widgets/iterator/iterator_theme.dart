// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';

enum DSIteratorSize { MINIMAL }

class DSIteratorTheme {
  final double? gutterSize;

  DSIteratorTheme({
    this.gutterSize,
  });

  DSIteratorTheme copyWithOverride(DSIteratorTheme? themeOverride) {
    return DSIteratorTheme(
      gutterSize: themeOverride?.gutterSize ?? gutterSize,
    );
  }
}

final DSIteratorTheme iteratorThemeDefault = DSIteratorTheme(
  gutterSize: kComponentSpacerM,
);

final DSIteratorTheme iteratorThemeSizeMinimal = DSIteratorTheme(
  gutterSize: 0,
);
