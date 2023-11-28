import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRich extends StatelessWidget {
  CustomRich({super.key, this.first, this.middle, this.secend});

  final Widget? first;
  final Widget? middle;
  final Widget? secend;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          if (first != null) WidgetSpan(child: first!, alignment: PlaceholderAlignment.middle),
          if (first != null && secend != null) WidgetSpan(child: middle ?? SizedBox(width: 5.sp)),
          if (secend != null) WidgetSpan(child: secend!, alignment: PlaceholderAlignment.middle),
        ],
      ),
    );
  }
}

Widget widgetInfo(Widget first, Widget secend) {
  return RichText(
    text: TextSpan(
      children: [
        WidgetSpan(child: first, alignment: PlaceholderAlignment.middle),
        WidgetSpan(child: SizedBox(width: 5.sp)),
        WidgetSpan(child: secend, alignment: PlaceholderAlignment.middle),
      ],
    ),
  );
}
