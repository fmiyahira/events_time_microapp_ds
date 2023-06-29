// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/src/common/null_safe_block.dart';
import 'package:events_time_microapp_ds/src/widgets/radio_button/components/radio_button_selected.dart';
import 'package:flutter/material.dart';

class DSCustomRadioButton extends StatelessWidget {
  final double? minWidth;
  final double? minHeight;
  final bool? selected;
  final Color? borderColor;
  final Color? pinColor;
  final ValueChanged<bool>? onChange;

  const DSCustomRadioButton({
    super.key,
    this.minWidth = 20.0,
    this.minHeight = 20.0,
    this.selected = false,
    this.onChange,
    this.borderColor,
    this.pinColor,
  });

  @override
  Widget build(BuildContext context) {
    return DSRadioButonSelected(
      selected: selected,
      onChange: onChange ?? (_) {},
      builder: (BuildContext context, Animation<double> animation) {
        return SizedBox(
          width: minWidth,
          height: minHeight,
          child: CustomPaint(
            painter: DSCustomRadioButtonPainter(
              animation: animation,
              checked: selected,
              borderColor: borderColor,
              pinColor: pinColor,
            ),
          ),
        );
      },
    );
  }
}

class DSCustomRadioButtonPainter extends CustomPainter {
  final Animation<double>? animation;
  final Color? borderColor;
  final Color? pinColor;
  final bool? checked;

  DSCustomRadioButtonPainter({
    this.animation,
    this.borderColor,
    this.pinColor,
    this.checked,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    const Offset center = Offset(10, 10);
    final Paint borderPaint = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    borderColor.let((Color it) => borderPaint..color = it);

    final Paint innerCirclePaint = Paint();

    pinColor.let((Color it) => innerCirclePaint
      ..color = it.withOpacity(
          pinColor == Colors.transparent ? 0 : animation?.value ?? 0));

    canvas.drawCircle(center, 10, borderPaint);
    canvas.drawCircle(center, 6, innerCirclePaint);
  }

  @override
  bool shouldRepaint(DSCustomRadioButtonPainter oldDelegate) {
    return true;
  }
}
