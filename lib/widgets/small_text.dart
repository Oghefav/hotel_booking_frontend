import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  const SmallText({
    super.key,
    required this.text,
    this.fontsize = 11,
    Color? color,
  }) : color = color ?? const Color(0xFF4A4A4A);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize.sp,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
        color: color
      ),
    );
  }
}
