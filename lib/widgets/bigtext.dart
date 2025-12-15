import 'package:flutter/material.dart';

class Bigtext extends StatelessWidget {
  String text;
  double fontsize;
  Color color;

  Bigtext({super.key, required this.text, this.fontsize = 24, Color? color})
    : color = color ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
