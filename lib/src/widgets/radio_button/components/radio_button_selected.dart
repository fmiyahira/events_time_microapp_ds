import 'package:flutter/material.dart';

class DSRadioButonSelected extends StatefulWidget {
  final bool? selected;
  final ValueChanged<bool>? onChange;
  final Widget? Function(BuildContext, Animation<double>) builder;

  const DSRadioButonSelected({
    super.key,
    this.selected = false,
    this.onChange,
    required this.builder,
  });

  @override
  State<DSRadioButonSelected> createState() => _DSRadioButonSelectedState();
}

class _DSRadioButonSelectedState extends State<DSRadioButonSelected>
    with SingleTickerProviderStateMixin {
  late bool checked;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    checked = widget.selected ?? false;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: checked ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(covariant DSRadioButonSelected oldWidget) {
    super.didUpdateWidget(oldWidget);

    checked = widget.selected ?? false;
    if (checked) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      checked = !checked;
      if (widget.onChange != null && widget.onChange is Function(bool)) {
        widget.onChange?.call(checked);
      }

      if (checked) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: widget.builder(context, controller),
    );
  }
}
