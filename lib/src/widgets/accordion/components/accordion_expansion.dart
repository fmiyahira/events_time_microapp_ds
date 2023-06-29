import 'package:flutter/material.dart';

class DSAccordionExpansion extends StatefulWidget {
  final Widget child;
  final bool isExpanded;

  const DSAccordionExpansion({
    super.key,
    required this.child,
    required this.isExpanded,
  });

  @override
  State<DSAccordionExpansion> createState() => _DSAccordionExpansionState();
}

class _DSAccordionExpansionState extends State<DSAccordionExpansion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _initializedAnimation();
    _validateExpansion();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(DSAccordionExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);

    _validateExpansion();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: _animation,
      child: widget.child,
    );
  }

  void _initializedAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _validateExpansion() {
    if (widget.isExpanded) {
      _controller.forward();
      return;
    }

    _controller.reverse();
  }
}
