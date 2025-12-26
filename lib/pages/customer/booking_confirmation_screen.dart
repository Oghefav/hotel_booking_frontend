import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: FilterHeaderDelegate(child: _appBarSection(), height: 90, ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _bookingSuccessSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    _bookingDetailsSection(),
                    SizedBox(height: 20),
                    _paymentReceiptSection(),
                    SizedBox(height: 20),
                    _getReminderSection(),
                    SizedBox(height: 20),
                    _shareButtonSection(),
                    SizedBox(height: 10),
                    _cancelBookingButtonSection(),
                    SizedBox(height: 10),
                    _viewBookingButtonSection(),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _appBarSection() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new_outlined),
                SizedBox(width: 15),
                SubTitleText(text: "Booking Confirmation"),
              ],
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }

  Widget _bookingSuccessSection() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(top: 5, left: 20, right: 20),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 80,
            ),
            SubTitleText(
              text: "Booking Confirmed!",
              color: Colors.white,
              fontsize: 25,
            ),
            SizedBox(height: 10),
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Booking Details"),
            // use #sh-7809012
            _detailBuilder("Booking Reference:", "#SBH-789012"),
            SizedBox(height: 10),
            _detailBuilder("Hotel:", "Grand City Resort"),
            SizedBox(height: 10),
            _detailBuilder("Room Type:", "Deluxe King Room"),
            SizedBox(height: 10),
            _detailBuilder("Check-in:", "Fri, 26 July 2024"),
            SizedBox(height: 10),
            _detailBuilder("Check-out:", "Sun, 28 July 2024 "),
            SizedBox(height: 10),
            _detailBuilder("Guests:", "2 Adults"),
            SizedBox(height: 10),
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
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Payment Reciept"),
            SizedBox(height: 10),
            _detailBuilder("Total Amount Paid:", "₦45000.00"),
            SizedBox(height: 10),
            _detailBuilder("Payment Method", "Credit Card"),
            SizedBox(height: 10),
            _detailBuilder("Transaction ID:", "PAY-342183848"),
            SizedBox(height: 10),
            CustomDivider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(text: "Total:", fontsize: 15,),
                SubTitleText(text: "₦45000.00", fontsize: 15),
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
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Get Reminders"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 250,
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
                      size: 40,
                    ),
                    SizedBox(height: 10),
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
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.5, color: Colors.grey.shade300),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.share_outlined, size: 20),
            SizedBox(width: 10),
            SubTitleText(text: "Share Details", fontsize: 15, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _cancelBookingButtonSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cancel, size: 20, color: Colors.white,),
            SizedBox(width: 10),
            SubTitleText(text: "Cancel Booking", fontsize: 15, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _viewBookingButtonSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bookmark_outline, size: 20, color: Colors.white,),
            SizedBox(width: 10),
            SubTitleText(text: "View My Bookings", fontsize: 15, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
