import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/dummydata/hotels.dart';
import 'package:hotel_booking_app/model/hotel_model.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class HotelListingScreen extends StatefulWidget {
  // change to statelessWidget after creating a controller
  const HotelListingScreen({super.key});

  @override
  State<HotelListingScreen> createState() => _HotelListingScreenState();
}

class _HotelListingScreenState extends State<HotelListingScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  List<HotelModel> hotelList = hotels;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent - 200)) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    // load more data from server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: FilterHeaderDelegate(
              height: 147.h,
              child: _filterAndMapviewIconsSection(),
            ),
          ),
          _hotelSection(),
        ],
      ),
    );
  }

  Widget _filterAndMapviewIconsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h,),
        Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h, bottom: 2.h),
          child: Row(children: [
            SizedBox(width: 8.w),
            Icon(Icons.arrow_back_ios, color: Colors.grey.shade600),
            SizedBox(width: 8.w),
            SubTitleText(text: "Hotel Listing"),
            SizedBox(width: 120.w),
            Icon(Icons.menu),
          ],),
        ),
        CustomDivider(),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 3.h, bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _filterAndMapViewIconBuilder(Icons.tune, "Filter & Sort", 105.w),
              _filterAndMapViewIconBuilder(Icons.map_outlined, "Map View", 90.w),
            ],
          ),
        ),
        SizedBox(height: 3.h,),
        CustomDivider(),
      ],
    );
  }

  Widget _filterAndMapViewIconBuilder(
    IconData iconData,
    String text,
    double width,
  ) {
    return Container(
      height: 40.h,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 1.2.w, color: Colors.grey.shade400),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, color: Color.fromARGB(190, 37, 37, 37)),
            SizedBox(width: 4.w),
            SmallText(text: text),
          ],
        ),
      ),
    );
  }

  Widget _hotelSection() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        var features = hotelList[index].features;
        return Card(
          margin: EdgeInsets.only(bottom: 13.h, right: 15.w, left: 15.h, top: 8.h),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r),
                    ),
                    child: Image.asset(
                      hotelList[index].image,
                      width: double.maxFinite,
                      height: 180.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    top: 8.h,
                    child: Container(
                      height: 40.h,
                      width: 33.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.r),
                        color: const Color.fromARGB(199, 165, 162, 162),
                      ),
                      child: Icon(Icons.favorite_border_outlined, size: 20.sp),
                    ),
                  ),
                  Positioned(
                    left: 8.w,
                    bottom: 8.h,
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(160, 11, 11, 11),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_outline,
                              color: const Color.fromARGB(255, 230, 182, 6),
                              size: 14.sp,
                            ),
                            SizedBox(width: 5),
                            SmallText(
                              text: "${hotelList[index].avgRating}",
                              color: AppColours.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(13.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bigtext(
                      text: hotelList[index].name,
                      color: const Color.fromARGB(230, 15, 3, 3),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade700,
                        ),
                        SmallText(
                          text:
                              '${hotelList[index].city}, ${hotelList[index].country}', color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SubTitleText(
                              text: "₦${hotelList[index].price.toInt()}",
                              color: Colors.lightBlue
                            ),
                            SmallText(text: "/night", color: Colors.grey.shade600),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            SmallText(
                              text:
                                  "Up to ${hotelList[index].guestsMax} guests", color: Colors.grey.shade600
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h,),
                    Wrap(
                      spacing: 7.w,
                      children: List.generate(features.length, (index) {
                        return Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                            side: BorderSide(color: AppColours.white),
                          ),
                          backgroundColor: Color.fromARGB(100, 212, 217, 220),
                          label: SmallText(text: features[index]),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }, childCount: hotelList.length),
    );
  }
}
