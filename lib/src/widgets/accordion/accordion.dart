import 'package:events_time_microapp_ds/src/common/constants/all.dart';
import 'package:events_time_microapp_ds/src/widgets/accordion/accordion_theme.dart';
import 'package:events_time_microapp_ds/src/widgets/accordion/components/accordion_expansion.dart';
import 'package:flutter/material.dart';

import '../text/all.dart';

class DSAccordion extends StatefulWidget {
  final DSAccordionTheme? theme;
  final DSAccordionType? type;
  final String title;
  final Widget child;
  final String? caption;
  final bool isExpanded;
  final Function(bool)? onChange;

  const DSAccordion({
    super.key,
    this.theme,
    this.type = DSAccordionType.LEAN,
    required this.title,
    required this.child,
    this.caption,
    this.isExpanded = false,
    this.onChange,
  });

  @override
  State<DSAccordion> createState() => _DSAccordionState();
}

class _DSAccordionState extends State<DSAccordion> {
  late DSAccordionTheme accordionTheme;
  late bool _isExpanded;

  void _builderTheme() {
    accordionTheme = accordionThemeDefault.copyWithOverride(widget.theme);
  }

  @override
  void initState() {
    super.initState();

    _isExpanded = widget.isExpanded;
    _builderTheme();
  }

  @override
  void didUpdateWidget(DSAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isExpanded != oldWidget.isExpanded) {
      setState(() {
        _isExpanded = widget.isExpanded;
      });
    }

    _builderTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: accordionTheme.padding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: accordionTheme.borderWidth!,
            color: accordionTheme.borderColor!,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildChild(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    final List<Widget> children = <Widget>[];

    if (widget.caption != null) {
      children.addAll(<DSText>[
        DSText(
          widget.caption ?? '',
          type: DSTextType.BODY_CAPTION,
        ),
        DSText(
          widget.title,
          type: DSTextType.HEADING4,
        ),
      ]);
    } else {
      children.add(
        DSText(
          widget.title,
          type: DSTextType.HEADING4,
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
          const SizedBox(width: kComponentSpacerXXL),
          Padding(
            padding: EdgeInsets.only(
              top: widget.caption != null ? 24.0 : 4.0,
            ),
            child: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: accordionTheme.iconColor,
              size: accordionTheme.iconSize,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChild() => DSAccordionExpansion(
        isExpanded: _isExpanded,
        child: Padding(
          padding: accordionTheme.contentPadding ?? EdgeInsets.zero,
          child: widget.child,
        ),
      );

  void _onTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    widget.onChange?.call(_isExpanded);
  }
}
