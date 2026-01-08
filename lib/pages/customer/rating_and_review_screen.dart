import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class RatingAndReviewScreen extends StatelessWidget {
  const RatingAndReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 38.h),
            _appBarSection(),
            CustomDivider(),
            _ratingAndReviewSection(),
          ],
        ),
      ),
    );
  }

  Widget _appBarSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical:4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [SubTitleText(text: "Leave a Review"), Icon(Icons.close)],
      ),
    );
  }

  Widget _ratingAndReviewSection() {
    return Padding(
      padding: EdgeInsets.all(23.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: "Overall Hotel Rating"),
          SizedBox(height: 7.h,),
          Row(
            children: [
              Wrap(
                children: List.generate(5, (index) {
                  return Icon(Icons.star_outline_rounded, color: Colors.blue.shade300);
                }),
              ),
              SmallText(text: "(4)"),
              SizedBox(width: 4.w,),
              SubTitleText(text: "4.3"),
      
            ],
          ),
          SizedBox(height: 14.h,),
          SmallText(text: "Your Rating"),
          SizedBox(height: 6.h,),
          Wrap(spacing: 4.w, children: List.generate(5, (index)=> Icon(Icons.star_outline, color: Colors.grey.shade800, size: 25.sp, )),),
          SizedBox(height: 14.h,),
          SmallText(text: "Your Review"),
          SizedBox(height: 9.h,),
          TextField(
            maxLines: 8,
            decoration: InputDecoration(
            hintText: "Share your experience with us...",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey.shade400)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(13.r))
          ),),
          SizedBox(height: 18.h,),
          Container(
        width: 350.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          color: Colors.lightBlue,
        ),
        child: Center(
          child: SubTitleText(text: "Submit Review", color: AppColours.white,),
        )
          
      ),
    
      
        ],
      ),
    );
  }

}
