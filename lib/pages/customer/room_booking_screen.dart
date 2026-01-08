import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class RoomBookingScreen extends StatefulWidget {
  const RoomBookingScreen({super.key});

  @override
  State<RoomBookingScreen> createState() => _RoomBookingScreenState();
}

class _RoomBookingScreenState extends State<RoomBookingScreen> {
  var _currentPage = 0.0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: FilterHeaderDelegate(child: CustomAppBar(title: "Luxury king Suite"), height: 73.h)),
          SliverList(
            delegate: SliverChildListDelegate([
              _imageSection(),
              _descriptionSection(),
              SizedBox(height: 9.h,),
              _featureSection(),
              SizedBox(height: 9.h,),
              _priceDetailSection(),
              SizedBox(height: 9.h,),
              _dateSelectionSection(),
              SizedBox(height: 9.h,),
              _guestSelectionSection(),
              SizedBox(height: 9.h,),
              CustomDivider(),
              SizedBox(height: 9.h,),
              _bookRoomButton(),
              SizedBox(height: 18.r,)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Container(
      height: 220.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: PageView.builder(
              itemCount: 4,
              // if i don't want smooth animation.
              // onPageChanged: (index) => _updatePosition(index),
              controller: _pageController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(9.h),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        child: Image.asset(
                          "assets/images/room1.avif",
                          height: 200.h,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 9.h,
                        left: 9.h,
                        child: SmallText(
                          text: "Image 1",
                          color: AppColours.white,
                          fontsize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          DotsIndicator(
            dotsCount: 4,
            position: _currentPage,
            decorator: DotsDecorator(
              activeColor: Colors.lightBlue,
              size: Size.square(8.0.h),
              activeSize: Size(12.0.w, 8.0.h),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionSection() {
    return Card(
      color: AppColours.white,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
      child: Padding(
        padding: EdgeInsets.all(11.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Luxury King Suite"),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(
                  Icons.star_outline,
                  color: const Color.fromARGB(255, 230, 182, 6),
                  size: 15.sp,
                ),
                SizedBox(width: 5),
                SmallText(text: "4.8(245 Reviews)", ),
              ],
            ),
            SizedBox(height: 4.h),
            Wrap(
              children: [
                SmallText(
                  text:
                      "Experience unparalleled comfort in our luxury King Suite. Designed for ultimate relaxation, this spacious suite features a king-size bed, a seperate living area, and stunning city views.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureSection() {
    return Card(
      color: AppColours.white,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 23.w),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Room Features"),
            Wrap(
              spacing: 10.w,
              children: [
                _featureBuilder(Icons.bed_outlined, "king Size Bed"),
                _featureBuilder(Icons.wifi, "Free Wi-fi"),
                _featureBuilder(Icons.shower, "Private Bathroom"),
                _featureBuilder(Icons.tv, "Smart Tv"),
                _featureBuilder(Icons.people_outline, "2 Adults, 1 Child"),
                _featureBuilder(Icons.local_parking_outlined, "Free Parking"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureBuilder(IconData iconData, String text) {
    return SizedBox(
      width: 110.w,
      child: Row(
        children: [
          Icon(
            iconData,
            color: const Color.fromARGB(255, 230, 182, 6),
            size: 13.sp,
          ),
          SizedBox(width: 5),
          SmallText(text: text,),
        ],
      ),
    );
  }

  Widget _priceDetailSection() {
    return Card(
      color: AppColours.white,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 23.w),
      child: Padding(
        padding: EdgeInsets.all(11.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Price Details"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "1 Night x ₦15000.00"),
                SmallText(text: "₦15000"),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Taxes & Fees"),
                SmallText(text: "₦1500"),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Service Fee"),
                SmallText(text: "₦150"),
              ],
            ),
            CustomDivider(),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(text: "Total", color: Colors.lightBlue),
                SubTitleText(text: "₦16650.00", color: Colors.lightBlue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateSelectionSection() {
    return Card(
      color: AppColours.white,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(11.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Select Dates"),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: const Color.fromARGB(255, 230, 182, 6),
                ),
                SizedBox(width: 4.w),
                SizedBox(
                  height: 55.h,
                  width: 140.w,
                  child: Wrap(
                    children: [
                      SmallText(
                        text: "Jan 1, 2026 - jan 12, 2026",
                        fontsize: 10.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 7.w),
                Container(
                  height: 40.h,
                  width: 65.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade50,
                  ),
                  child: Center(
                    child: SmallText(
                      text: "Change",
                      color: Colors.blue.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _guestSelectionSection() {
    return Card(
      color: AppColours.white,
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 23.w),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Guests"),
            SizedBox(height: 14.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Adults"),
                Row(
                  children: [
                    _signBuilder(Icons.remove),
                    SizedBox(width: 17.w,),
                    SubTitleText(text: '1'),
                    SizedBox(width: 17.w,),
                    _signBuilder(Icons.add),
                  ],
                ),
              ],
            ),
            SizedBox(height: 18.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Children"),
                Row(
                  children: [
                    _signBuilder(Icons.remove),
                    SizedBox(width: 15.w,),
                    SubTitleText(text: "0"),
                    SizedBox(width: 15.w,),
                    _signBuilder(Icons.add),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _signBuilder(IconData iconData) {
    return Container(
      height: 28.h,
      width: 23.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade400, width: 1.5.w),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey.shade200,
      ),
      child: Center(child: Icon(iconData, color: Colors.blue.shade400)),
    );
  }

  Widget _bookRoomButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 280.w,
        height: 38.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: Colors.blue.shade400,
        ),
        child: Center(
          child: SubTitleText(text: "Book Now - ₦16550", color: AppColours.white,),
        )
          
      ),
    );
  }
}
