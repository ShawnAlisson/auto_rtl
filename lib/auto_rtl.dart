library auto_rtl;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AutoRTL extends StatefulWidget {
  final String content;
  final bool? defaultRTL;
  final Widget child;
  final void Function(bool isRTL)? onDirectionChange;

  AutoRTL(
      {Key? key,
      required this.content,
      this.defaultRTL,
      required this.child,
      this.onDirectionChange})
      : super(key: key);

  @override
  _AutoRTLState createState() => _AutoRTLState();
}

class _AutoRTLState extends State<AutoRTL> {
  late String content;
  late Widget childWidget;
  bool? defaultRTL = false;

  @override
  void didUpdateWidget(AutoRTL oldWidget) {
    if (isRTL(oldWidget.content) != isRTL(widget.content)) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => widget.onDirectionChange?.call(isRTL(widget.content)));
    }
    super.didUpdateWidget(oldWidget);
  }

  bool isRTL(String content) {
    if (content.isEmpty && defaultRTL == true)
      return Directionality.of(context) == TextDirection.rtl;
    else if (content.isEmpty && defaultRTL == false)
      return Directionality.of(context) == TextDirection.ltr;
    return intl.Bidi.detectRtlDirectionality(content);
  }

  @override
  Widget build(BuildContext context) {
    content = widget.content;
    defaultRTL = widget.defaultRTL;
    childWidget = widget.child;
    return Directionality(
        textDirection: isRTL(content) ? TextDirection.rtl : TextDirection.ltr,
        child: childWidget);
  }
}
