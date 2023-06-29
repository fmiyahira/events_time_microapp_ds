import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_ds/src/widgets/toast/toast_widget.dart';
import 'package:flutter/cupertino.dart';

mixin DSToast {
  static const int _duration = 5;
  static late OverlayState? _overlayState;
  static late OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static Future<void> show(
    String text,
    BuildContext context, {
    DSToastTheme? theme,
    int duration = _duration,
  }) async {
    dismiss();
    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (_) => ToastWidget(
        text: text,
        dismiss: dismiss,
        theme: theme,
      ),
    );

    _isVisible = true;
    _overlayState?.insert(_overlayEntry);
    await Future<void>.delayed(Duration(
      seconds: duration,
    ));
    dismiss();
  }

  static void dismiss() {
    if (!_isVisible) {
      return;
    }

    _isVisible = false;
    _overlayEntry.remove();
  }
}
