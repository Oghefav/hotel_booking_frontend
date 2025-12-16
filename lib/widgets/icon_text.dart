import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  IconText({super.key, required this.text, this.fontsize = 15, Color? color})
    : color = color ?? Color.fromARGB(190, 37, 37, 37);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w900,
        color: color,
      ),
    );
  }
}
