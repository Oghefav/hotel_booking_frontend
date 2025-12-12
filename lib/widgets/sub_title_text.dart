import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final double fontsize;

  const SubTitleText({super.key, required this.text, this.fontsize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700,
        color: Colors.grey.shade900,
      ),
    );
  }
}
