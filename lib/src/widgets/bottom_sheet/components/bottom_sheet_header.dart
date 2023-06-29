import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

class DSBottomSheetHeader extends StatelessWidget {
  final String title;
  final Function()? onDismiss;

  const DSBottomSheetHeader({
    super.key,
    required this.title,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: DSText(
              title,
              type: DSTextType.HEADING3,
            ),
          ),
          DSIconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: Icons.close,
            theme: DSIconButtonTheme(
              iconPadding: 0.0,
              alignment: Alignment.topRight,
            ),
          )
        ],
      ),
    );
  }
}
