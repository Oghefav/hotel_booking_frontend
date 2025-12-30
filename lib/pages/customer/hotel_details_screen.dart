import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true
        ,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPersistentHeader(delegate: FilterHeaderDelegate(child: CustomAppBar(title: "The Grand Hotel"), height: 80.sp), pinned: true,),
            SliverList(
              delegate: SliverChildListDelegate([
                _hotelImageSection(),
                _descriptionSection(),
                _avaliableRoomSection(),
                _reviewSection(),
                SizedBox(height: 13.h,),
                CustomDivider(),
                SizedBox(height: 8.h,),
                _viewRoomSection(),
                SizedBox(height: 25.h,),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hotelImageSection() {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 12.w),
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          children: List.generate(3, ((int index) {
            return Container(
              padding: EdgeInsets.only(left: 13.w, top: 8.h, bottom: 8.h),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Image.asset(
                  "assets/images/hotel2.webp",
                  height: 185.h,
                  width: 250.w,
                  fit: BoxFit.fill,
                ),
              ),
            );
          })),
        ),
      ),
    );
  }

  Widget _descriptionSection() {
    return Padding(
      padding: EdgeInsets.all(18.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bigtext(text: "The Grand Hotel"),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.lightBlue,
                size: 14.sp,
              ),
              SmallText(text: "123 Onuiyi Street, Nsukka"),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Icon(Icons.star_outline, color: Colors.lightBlue, size: 14.sp),
              SmallText(
                text:  "4.8 (120 Reviews)", color: Colors.lightBlue,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SubTitleText(text: "Description"),
          Wrap(
            children: [
              SmallText(
                text:
                    "Experience unparalled luxury at The Grand Hotel, a landmark of sophisatication located in the heart of Nsukka. Boasting breathtaking views of the city skyline and the tranquil ocean, our hotel offers and exquiste blend of classic elegance and modern comfort. Each room is meticulously designed with plusd furnishings and state-of-the-art amenities to ensure a memeroble stay, indulge in our world-class dining, rejuvenate at our spa, or unwind by the pristine poolside. The Grand Hotel is more than just a place to stay; it's an experience.",
                    fontsize: 7.sp,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          SubTitleText(text: "Amentites"),
          Wrap(
            // modify after connecting to server
            spacing: 4.h,
            children: [
              _chipBuilder("Free Wi-fi"),
              _chipBuilder("Free Parking"),
              _chipBuilder("Restaurant"),
              _chipBuilder("Fitness Center"),
              _chipBuilder("Air Conditioning"),
              _chipBuilder("Mountain View"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chipBuilder(String text) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(color: AppColours.white),
      ),
      shadowColor: Colors.transparent,
      backgroundColor: Color(0x66ECEFF1),
      label: SmallText(text: text, fontsize: 7.sp,),
    );
  }

  Widget _avaliableRoomSection() {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubTitleText(text: "Available Rooms"),
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 13.w,
              direction: Axis.horizontal,
              children: List.generate(3, (index) {
                return Container(
                  height: 215.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.r),
                          ),
                          child: Image.asset(
                            "assets/images/room1.avif",
                            height: 130.h,
                            width: 200.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: "Deluxe King Room",
                              color: Colors.black,
                            ),

                            SmallText(
                              text: "₦25000/Night",
                              color: Colors.lightBlue,
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              width: 200.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.r),
                                ),
                                color: Colors.lightBlue,
                              ),
                              child: Center(
                                child: SmallText(
                                  text: "View Details",
                                  color: AppColours.white,
                                ),
                              ),
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

  Widget _reviewSection() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      color: AppColours.white,
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(text: "Guest Reviews"),
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      color: Colors.lightBlue,
                      size: 15.sp,
                    ),
                    SizedBox(width: 2.w,),
                    SmallText(
                      text: "4.8/5",
                      fontsize: 9.sp,
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
              children: [
                SmallText(
                  text:
                      "Based on 120 guests reviews, guest consistently praise our comfortable rooms and excellent service",
                      fontsize: 7.sp,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              width: 300.w,
              height: 32.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppColours.white,
              ),
              child: Row(
                children: [
                  SizedBox(width: 100),
                  Icon(CupertinoIcons.square_pencil, color: Colors.grey.shade700),
                  SizedBox(width: 5),
                  SmallText(
                    text: "Write a Review",
                    // color: Colors.black,
                    fontsize: 8.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewRoomSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: 300.w,
        height: 34.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          color: Colors.lightBlue,
        ),
        child: Center(
          child: SmallText(text: "View Rooms", color: AppColours.white, ),
        )
          
      ),
    );
  }
}
