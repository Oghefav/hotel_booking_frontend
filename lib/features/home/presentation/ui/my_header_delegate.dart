import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';

class MyHeaderDelegate  extends SliverPersistentHeaderDelegate{
  final Widget child;

  const MyHeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Material(
      color: AppColours.white,
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Bigtext(text: "Quick Filters"),
          SizedBox(height: 40.h,
          child: child)]  )  ),
    );
  }

  @override
  double get maxExtent => 100.h;

  @override
  double get minExtent => 100.h;

  @override 
  bool shouldRebuild(covariant MyHeaderDelegate oldDelegate) => oldDelegate.child != child;

}
