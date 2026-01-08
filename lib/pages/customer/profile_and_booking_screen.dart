import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/dummydata/hotels.dart';
import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class ProfileAndBookingScreen extends StatelessWidget {
  const ProfileAndBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookingModel> bookinglist = bookings;
    return Scaffold(
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: FilterHeaderDelegate(
              child: _appBarSection(),
              height: 101.h,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _profileInfoSection(),
              SizedBox(height: 8.h),
              _upcomingBookingsSection(bookinglist),
              SizedBox(height: 18.h),
              _pastBookingsSection(bookinglist),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _appBarSection() {
    return Column(
      children: [
        CustomDivider(),
        Container(
          padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 38.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  color: Colors.lightBlue
                ),
                child: Center(
                  child: Icon(
                    size: 30.sp,
                    Icons.apartment_outlined,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              CircleAvatar(
          radius: 25.r,
          backgroundColor: const Color.fromARGB(255, 239, 219, 243),
          child: Image.asset(
            "assets/images/female_avatar.png",
            height: 90.h,
            width: 80.w,
          ),
        ),
            ],
          ),
        ),
        CustomDivider(),
      ],
    );
  }

  Widget _profileInfoSection() {
    // add admin linked profile info section here if user is admin
    return Column(
      children: [
        Card(
          color: Colors.white,
          margin: EdgeInsets.only(top: 17.h, left: 15.w, right: 15.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: const Color.fromARGB(255, 239, 219, 243),
                  child: Image.asset(
                    "assets/images/female_avatar.png",
                    height: 90.h,
                    width: 80.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [Bigtext(text: "Alice Smith")]),
                      SmallText(text: "alicesmith@gmail.com",),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Row(
              children: [
                Icon(
                  Icons.manage_accounts_outlined,
                  size: 20.sp,
                  color: Colors.grey.shade800,
                ),
                SizedBox(width: 8.w),
                SubTitleText(
                  text: "Edit Profile",
                  color: Colors.grey.shade900,
                  fontsize: 11.sp,
                ),
                SizedBox(width: 140.w),
                Icon(Icons.arrow_forward_ios_outlined, size: 13.sp,)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _upcomingBookingsSection(List<BookingModel> bookinglist) {
    List<BookingModel> bookinglist = bookings;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 15.w),
            Bigtext(text: "Upcoming Bookings",),
          ],
        ),
        SizedBox(height: 6.h),
        for (var i = 0; i < 2; i++)
          if (bookinglist[i].bookingStatus != 'Cancelled' &&
              bookinglist[i].bookingStatus != 'Completed')
            Card(
              color: AppColours.white,
              margin: EdgeInsets.only(bottom: 13.h, right: 15.w, left: 15.w, top: 8.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r),
                    ),
                    child: Image.asset(
                      bookinglist[i].roomImage,
                      width: double.maxFinite,
                      height: 180.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(13.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bigtext(
                          text: bookinglist[i].hotelName,
                          color: const Color.fromARGB(230, 15, 3, 3),
                          fontsize: 12.sp,
                        ),
                        SizedBox(height: 4.h),
                        SubTitleText(
                          text: bookinglist[i].roomType,
                          color: Colors.grey.shade600,
                        ),

                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(width: 8.w),
                            SmallText(
                              text:
                                  "${bookinglist[i].checkInDate.year}-${bookinglist[i].checkInDate.month}-${bookinglist[i].checkInDate.day} - ${bookinglist[i].checkOutDate.year}-${bookinglist[i].checkOutDate.month}-${bookinglist[i].checkOutDate.day}",
                                  fontsize: 10.sp,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                        SizedBox(height: 13.h),
                        SubTitleText(
                          text: bookinglist[i].bookingStatus,
                          fontsize: 11.sp,
                          color: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ],
    );
  }

  Widget _pastBookingsSection(List<BookingModel> bookinglist) {
    bool hasPastBookings = bookinglist.any(
      (booking) =>
          booking.bookingStatus == 'Cancelled' ||
          booking.bookingStatus == 'Completed',
    );
    List<BookingModel> pastBookings = [];
    int numberOfPastBookings = 0;
    if (hasPastBookings) {
      pastBookings =
          bookinglist
              .where(
                (booking) =>
                    booking.bookingStatus == 'Cancelled' ||
                    booking.bookingStatus == 'Completed',
              )
              .toList();
      if (pastBookings.length >= 2) {
        numberOfPastBookings = 2;
      } else {
        numberOfPastBookings = pastBookings.length;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasPastBookings) ...[
          Row(
            children: [
              SizedBox(width: 15.w),
              Bigtext(text: "Past Bookings",),
            ],
          ),
          SizedBox(height: 8),
          if (pastBookings.isNotEmpty)
            for (var i = 0; i < numberOfPastBookings; i++)
              Card(
                color: AppColours.white,
                margin: EdgeInsets.only(
                  bottom: 13.h, right: 15.w, left: 15.w, top: 8.w
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r),
                      ),
                      child: Image.asset(
                        pastBookings[i].roomImage,
                        width: double.maxFinite,
                        height: 180.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Bigtext(
                            text: pastBookings[i].hotelName,
                            color: const Color.fromARGB(230, 15, 3, 3),
                            fontsize: 12.sp,
                          ),
                          SizedBox(height: 4.h),
                          SubTitleText(
                            text: pastBookings[i].roomType,
                            color: Colors.grey.shade600,
                          ),

                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.grey.shade700,
                              ),
                              SizedBox(width: 8.w),
                              SmallText(
                                text:
                                    "${pastBookings[i].checkInDate.year}-${pastBookings[i].checkInDate.month}-${pastBookings[i].checkInDate.day} - ${pastBookings[i].checkOutDate.year}-${pastBookings[i].checkOutDate.month}-${pastBookings[i].checkOutDate.day}",
                                fontsize: 11.sp,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 28.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                  color:
                                      pastBookings[i].bookingStatus ==
                                              'Completed'
                                          ? Color(0x99ECEFF1)
                                          : const Color.fromARGB(
                                            50,
                                            244,
                                            67,
                                            54,
                                          ),
                                ),

                                child: Center(
                                  child: SubTitleText(
                                    text: pastBookings[i].bookingStatus,
                                    fontsize: 15,
                                    color:
                                        pastBookings[i].bookingStatus ==
                                                "Completed"
                                            ? Colors.lightBlue.shade400
                                            : const Color.fromARGB(
                                              255,
                                              225,
                                              77,
                                              77,
                                            ),
                                  ),
                                ),
                              ),
                              if (pastBookings[i].bookingStatus == "Completed")
                                Container(
                                  height: 38.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.lightBlue.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star_outline,
                                          color: Colors.lightBlue.shade400,
                                        ),
                                        SizedBox(width: 8.w),
                                        SmallText(
                                          text: "Leave Review",
                                          color: Colors.lightBlue.shade400,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ],
    );
  }
}
