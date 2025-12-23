import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final double fontsize;
   final Color color;

  const SubTitleText({super.key, required this.text, this.fontsize = 20, Color? color}) : color = color ?? const Color(0xFF212121);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Montserrat",
        color: color,
      ),
    );
  }
}
