import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DSAssets {
  static const String logo_light = 'lib/assets/logo/';
  static const String logo_dark = 'lib/assets/logo/';

  static Widget render(
    final String path, {
    final double? width,
    final double? height,
    final BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
