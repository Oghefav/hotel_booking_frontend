import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bigtext extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  const Bigtext({super.key, required this.text, this.fontsize = 18, Color? color})
    : color = color ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize.sp,
        fontFamily: "montserrat",
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}
