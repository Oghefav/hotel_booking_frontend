import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      color: Colors.white,
      child: Column(
        children: [
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new_outlined),
                SizedBox(width: 15.w),
                SubTitleText(text: title),
              ],
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}
