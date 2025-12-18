import 'package:flutter/material.dart';
import 'package:hotel_booking_app/dummydata/hotels.dart';
import 'package:hotel_booking_app/model/booking_model.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            toolbarHeight: 70,
            pinned: true,
            actionsPadding: EdgeInsets.only(right: 20, left: 20, top: 20),
            leadingWidth: 70,
            leading: Container(
              // height: 10,
              width: 50,
              margin: EdgeInsets.only(left: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: const Color.fromARGB(255, 92, 164, 222),
              ),
              child: Center(
                child: Icon(
                  size: 40,
                  Icons.apartment_outlined,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
            actions: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromARGB(255, 239, 219, 243),
                child: Image.asset(
                  "assets/images/female_avatar.png",
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              CustomDivider(),
              _profileInfoSection(),
              SizedBox(height: 10),
              _upcomingBookingsSection(bookinglist),
              SizedBox(height: 20),
              _pastBookingsSection(bookinglist),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _profileInfoSection() {
    // add admin linked profile info section here if user is admin
    return Column(
      children: [
        Card(
          color: AppColours.white,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color.fromARGB(255, 239, 219, 243),
                  child: Image.asset(
                    "assets/images/female_avatar.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [Bigtext(text: "Alice Smith")]),
                      SmallText(text: "alicesmith@gmail.com", fontsize: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppColours.white,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.manage_accounts_outlined,
                  size: 30,
                  color: Colors.grey.shade800,
                ),
                SizedBox(width: 10),
                SmallText(
                  text: "Edit Profile",
                  color: Colors.grey.shade900,
                  fontsize: 20,
                ),
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
            SizedBox(width: 20),
            Bigtext(text: "Upcoming Bookings", fontsize: 26),
          ],
        ),
        SizedBox(height: 8),
        for (var i = 0; i < 2; i++)
          if (bookinglist[i].bookingStatus != 'Cancelled' &&
              bookinglist[i].bookingStatus != 'Completed')
            Card(
              color: AppColours.white,
              margin: EdgeInsets.only(bottom: 15, right: 20, left: 20, top: 10),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      bookinglist[i].roomImage,
                      width: double.maxFinite,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bigtext(
                          text: bookinglist[i].hotelName,
                          color: const Color.fromARGB(230, 15, 3, 3),
                        ),
                        SizedBox(height: 5),
                        SubTitleText(
                          text: bookinglist[i].roomType,
                          fontsize: 17,
                          color: Colors.grey.shade600,
                        ),

                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(width: 10),
                            SmallText(
                              text:
                                  "${bookinglist[i].checkInDate.year}-${bookinglist[i].checkInDate.month}-${bookinglist[i].checkInDate.day} - ${bookinglist[i].checkOutDate.year}-${bookinglist[i].checkOutDate.month}-${bookinglist[i].checkOutDate.day}",
                              fontsize: 17,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        SubTitleText(
                          text: bookinglist[i].bookingStatus,
                          fontsize: 15,
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
              SizedBox(width: 20),
              Bigtext(text: "Past Bookings", fontsize: 26),
            ],
          ),
          SizedBox(height: 8),
          if (pastBookings.isNotEmpty)
            for (var i = 0; i < numberOfPastBookings; i++)
              Card(
                  color: AppColours.white,
                margin: EdgeInsets.only(
                  bottom: 15,
                  right: 20,
                  left: 20,
                  top: 10,
                ),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        pastBookings[i].roomImage,
                        width: double.maxFinite,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Bigtext(
                            text: pastBookings[i].hotelName,
                            color: const Color.fromARGB(230, 15, 3, 3),
                          ),
                          SizedBox(height: 5),
                          SubTitleText(
                            text: pastBookings[i].roomType,
                            fontsize: 17,
                            color: Colors.grey.shade600,
                          ),

                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.grey.shade700,
                              ),
                              SizedBox(width: 10),
                              SmallText(
                                text:
                                    "${pastBookings[i].checkInDate.year}-${pastBookings[i].checkInDate.month}-${pastBookings[i].checkInDate.day} - ${pastBookings[i].checkOutDate.year}-${pastBookings[i].checkOutDate.month}-${pastBookings[i].checkOutDate.day}",
                                fontsize: 17,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),

                              color: pastBookings[i].bookingStatus == 'Completed' ? Color(0x99ECEFF1) : const Color.fromARGB(50, 244, 67, 54)),
                              
                              child: Center(
                                child: SubTitleText(
                                  text: pastBookings[i].bookingStatus,
                                  fontsize: 15,
                                  color: pastBookings[i].bookingStatus == "Completed" ? Colors.lightBlue.shade400 : const Color.fromARGB(255, 225, 77, 77),
                                ),
                              ),
                            ),
                            if (pastBookings[i].bookingStatus == "Completed")
                            Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue.shade400 ),
                              borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.star_outline, color: Colors.lightBlue.shade400 ,),
                                    SizedBox(width: 10,),
                                    SmallText(text: "Leave Review", color: Colors.lightBlue.shade400 ,)
                                  ],
                                ),
                              ),
                            )
                            ]
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
