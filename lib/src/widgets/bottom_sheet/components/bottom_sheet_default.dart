import 'package:flutter/material.dart';

mixin DSBottomSheetDefault {
  BuildContext get screenContext;
  Widget get self;
  VoidCallback? get onDismiss;

  Future<T?> show<T>({bool isDismissible = true}) {
    return showModalBottomSheet<T>(
      context: screenContext,
      builder: (BuildContext builder) => self,
      shape: _shape,
      isScrollControlled: true,
      isDismissible: isDismissible,
    ).whenComplete(() {
      onDismiss?.call();
    });
  }
}

const Radius _radiusOfCornerOfBorder = Radius.circular(24);

const RoundedRectangleBorder _shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: _radiusOfCornerOfBorder,
    topRight: _radiusOfCornerOfBorder,
  ),
);
