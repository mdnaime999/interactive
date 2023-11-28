import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({super.key, required this.icon, this.color, required this.onClick});
  final Widget icon;
  final Color? color;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
        shape: CircleBorder(),
      ),
      onPressed: onClick,
      child: icon,
    );
  }
}
