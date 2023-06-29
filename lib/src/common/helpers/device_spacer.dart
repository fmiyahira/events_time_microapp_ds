import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/common/variant_types.dart';
import 'package:flutter/material.dart';

mixin DSDeviceSpacer {
  static late VariantTypes deviceSize;
  static const double baseDeviceSize = 360;

  static bool isDeviceLarge(BuildContext context) {
    return MediaQuery.of(context).size.width >= baseDeviceSize;
  }

  static bool isDeviceSmall(BuildContext context) {
    return !isDeviceLarge(context);
  }

  static EdgeInsets getDeviceSpacer(
    BuildContext context, {
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return isDeviceLarge(context)
        ? EdgeInsets.only(
            top: top ?? kLayoutSpacerXXS,
            bottom: bottom ?? kLayoutSpacerS,
            left: left ?? kLayoutSpacerS,
            right: right ?? kLayoutSpacerS,
          )
        : EdgeInsets.only(
            top: top ?? kLayoutSpacerXXS,
            bottom: bottom ?? kLayoutSpacerXS,
            left: left ?? kLayoutSpacerXS,
            right: right ?? kLayoutSpacerXS,
          );
  }

  static VariantTypes getDeviceSize(BuildContext context) {
    deviceSize = isDeviceLarge(context)
        ? VariantTypes.LARGE_DEVICES
        : VariantTypes.SMALL_DEVICES;

    return deviceSize;
  }

  static double getDefaultDimension(BuildContext context) {
    return isDeviceLarge(context) ? kLayoutSpacerS : kLayoutSpacerXS;
  }
}
