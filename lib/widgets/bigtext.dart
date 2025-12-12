import 'package:flutter/material.dart';

class Bigtext extends StatelessWidget {
  String text;
  double fontsize;

  Bigtext({super.key, required this.text, this.fontsize = 24});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    );
  }
}
