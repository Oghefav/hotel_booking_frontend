import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColours.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            _appBarSection(),
            CustomDivider(),
            _searchSearch(),
            _quickFilterSection(),
            _featuredHoteSection(),
          ],
        ),
      ),
    );
  }

  Widget _appBarSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40.h,
            width: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color: Colors.lightBlue,
            ),
            child: Center(
              child: Icon(
                Icons.apartment_outlined,
                color: Colors.grey.shade200,
                size: 25.sp,
              ),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 25.sp),
                ),
                CircleAvatar(
                  radius: 20.r,
                  foregroundColor: Colors.purple.shade200,
                  backgroundImage: AssetImage('assets/images/male_avatar.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchSearch() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300, width: 1.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: Colors.white,
      margin: EdgeInsets.all(15.h),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textFieldContainer(
              400.w,
              Icon(Icons.location_on_outlined),
              "where do you want to stay ?",
            ),
            SizedBox(height: 13.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldContainer(
                  122.w,
                  Icon(Icons.calendar_month_outlined),
                  "Dates",
                ),
                _textFieldContainer(
                  122.w,
                  Icon(Icons.people_alt_outlined),
                  "Guests",
                ),
              ],
            ),
            SizedBox(height: 13.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: Colors.lightBlue,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, color: AppColours.white),
                    SizedBox(width: 6.w),
                    Text(
                      "Find Hotels",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: "montserrat",
                        fontWeight: FontWeight.w700,
                        color: AppColours.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldContainer(double width, Widget prefixIcon, String helpText) {
    return Container(
      width: width,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Row(
        children: [
          prefixIcon,
          SizedBox(width: 4.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: helpText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
              style: TextStyle(decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickFilterSection() {
    return Padding(
      padding: EdgeInsets.all(13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bigtext(text: "Quick Filters"),
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8.h,
              children: [
                // Use choiceChip after connecting to server
                _chipBuilder(text: "Popular", color: Colors.lightBlue),
                _chipBuilder(text: "Luxury"),
                _chipBuilder(text: "Boutique"),
                _chipBuilder(text: "Budget-Friendly"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipBuilder({required String text, Color? color}) {
    return Chip(
      color: color != null ? WidgetStateProperty.all(color) : WidgetStateProperty.all(Colors.white),
      side: BorderSide(color: color == null ? Colors.grey.shade400: Colors.lightBlue, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r), ),
      label: SmallText(text: text),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, color:  color== null ? Colors.black: Colors.white),
      backgroundColor: color,
    );
  }

  Widget _featuredHoteSection() {
    return Padding(
      padding: EdgeInsets.all(13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bigtext(text: "Featured Hotels"),
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 14.h,
              direction: Axis.horizontal,
              children: List.generate(3, (index) {
                return Container(
                  height: 230.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/hotel1.webp",
                                height: 170.h,
                                width: 200.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 13.h,
                              right: 12.w,
                              child: Icon(
                                Icons.favorite_border,
                                color: AppColours.white,
                                size: 18.sp,
                              ),
                            ),
                            Positioned(
                              bottom: 35.h,
                              left: 8.w,
                              child: Text(
                                "Gordon Hotel",
                                style: TextStyle(
                                  wordSpacing: 4.w,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 14.h,
                              left: 8.w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: AppColours.white,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "3.5",
                                    style: TextStyle(
                                      color: AppColours.white,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.grey.shade700,),
                                SmallText(text: "Nsukka, Enugu")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubTitleText(text: "₦24000", color: Colors.lightBlue,),
                                SmallText(text: "Per Night",),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
