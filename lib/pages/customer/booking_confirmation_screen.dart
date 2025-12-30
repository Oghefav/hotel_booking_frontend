import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: FilterHeaderDelegate(child: const CustomAppBar(title: "Booking Confirmation"), height: 80.h, ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _bookingSuccessSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    _bookingDetailsSection(),
                    SizedBox(height: 15.h),
                    _paymentReceiptSection(),
                    SizedBox(height: 15.h),
                    _getReminderSection(),
                    SizedBox(height: 15.h),
                    _shareButtonSection(),
                    SizedBox(height: 10.h),
                    _cancelBookingButtonSection(),
                    SizedBox(height: 10.h),
                    _viewBookingButtonSection(),
                    SizedBox(height: 15.h,)
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _bookingSuccessSection() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(top: 5.h, left: 15.w, right: 15.w),
      child: Padding(
        padding: EdgeInsets.all(25.h),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 60.sp,
            ),
            SubTitleText(
              text: "Booking Confirmed!",
              color: Colors.white,
              fontsize: 20.sp,
            ),
            SizedBox(height: 8.h),
            SmallText(
              text: "Your reseration has been successfully",
              color: Colors.white,
            ),
            SmallText(text: "placed. Enjoy your stay!", color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _bookingDetailsSection() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Booking Details"),
            // use #sh-7809012
            _detailBuilder("Booking Reference:", "#SBH-789012"),
            SizedBox(height: 8.h),
            _detailBuilder("Hotel:", "Grand City Resort"),
            SizedBox(height: 8.h),
            _detailBuilder("Room Type:", "Deluxe King Room"),
            SizedBox(height: 8.h),
            _detailBuilder("Check-in:", "Fri, 26 July 2024"),
            SizedBox(height: 8.h),
            _detailBuilder("Check-out:", "Sun, 28 July 2024 "),
            SizedBox(height: 8.h),
            _detailBuilder("Guests:", "2 Adults"),
            SizedBox(height: 8.h),
            _detailBuilder("Status", "Confirmed"),
          ],
        ),
      ),
    );
  }

  Widget _detailBuilder(String title, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallText(text: title),
        SmallText(text: detail, color: Colors.black),
      ],
    );
  }

  Widget _paymentReceiptSection() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Payment Reciept"),
            SizedBox(height: 8.h),
            _detailBuilder("Total Amount Paid:", "₦45000.00"),
            SizedBox(height: 8.h),
            _detailBuilder("Payment Method", "Credit Card"),
            SizedBox(height: 8.h),
            _detailBuilder("Transaction ID:", "PAY-342183848"),
            SizedBox(height: 8.h),
            CustomDivider(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(text: "Total:", fontsize: 12.sp,),
                SubTitleText(text: "₦45000.00", fontsize: 12.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getReminderSection() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Get Reminders"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 36.h,
                  width: 210.w,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        SmallText(
                          text:
                              "Receive email and app notifications before your trip",
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      Icons.toggle_on_outlined,
                      color: Colors.lightBlueAccent,
                      size: 30.sp,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _shareButtonSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 35.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1.w, color: Colors.grey.shade300),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.share_outlined, size: 15.sp),
            SizedBox(width: 8.w),
            SmallText(text: "Share Details", fontsize: 12.sp, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _cancelBookingButtonSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 35.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cancel_outlined, size: 15.sp, color: Colors.white,),
            SizedBox(width: 8.w),
            SmallText(text: "Cancel Booking", fontsize: 12.sp, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _viewBookingButtonSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 35.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bookmark_outline, size: 15.sp, color: Colors.white,),
            SizedBox(width: 8.w),
            SubTitleText(text: "View My Bookings", fontsize: 12.sp, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
