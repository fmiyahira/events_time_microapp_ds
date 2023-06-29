// ignore_for_file: public_member_api_docs, sort_constructors_first
enum DSBottomSheetSize { LARGE }

enum DSBottomSheetType { LEAN }

class DSBottomSheetTheme {
  final bool? hasIcon;
  final double? topImageHeight;

  DSBottomSheetTheme({
    this.hasIcon,
    this.topImageHeight,
  });

  DSBottomSheetTheme copyWithOverride(DSBottomSheetTheme? themeOverride) {
    return DSBottomSheetTheme(
      hasIcon: themeOverride?.hasIcon ?? hasIcon,
      topImageHeight: themeOverride?.topImageHeight ?? topImageHeight,
    );
  }
}

final DSBottomSheetTheme bottomSheetThemeDefault = DSBottomSheetTheme(
  hasIcon: true,
  topImageHeight: 120,
);

final DSBottomSheetTheme bottomSheetThemeTypeLean = DSBottomSheetTheme(
  hasIcon: false,
);
