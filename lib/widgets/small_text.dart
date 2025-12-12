import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
    final String text;
  final double fontsize;
  final Color color;

  SmallText({
    super.key,
    required this.text,
    this.fontsize = 15,
    Color? color,
  }) : color = color ?? Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
        color: color
      ),
    );
  }
}
