import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
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

  // void _validatePosition(double){
  //   if ()
  // }

  // void _updatePosition(int position) {
  //   setState(() {
  //     _currentPage = position.toDouble();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 40,
            pinned: true,
            actionsPadding: EdgeInsets.only(top: 20, bottom: 10),
            // backgroundColor: Colors.amber,
            leading: Icon(Icons.arrow_back_ios),
            title: Bigtext(text: "Luxury king Suite", fontsize: 20),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              CustomDivider(),
              _imageSection(),
              _descriptionSection(),
              SizedBox(height: 10,),
              _featureSection(),
              SizedBox(height: 10,),
              _priceDetailSection(),
              SizedBox(height: 10,),
              _dateSelectionSection(),
              SizedBox(height: 10,),
              _guestSelectionSection(),
              SizedBox(height: 10,),
              CustomDivider(),
              SizedBox(height: 10,),
              _bookRoomButton(),
              SizedBox(height: 20,)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Container(
      height: 240,
      margin: EdgeInsets.symmetric(horizontal: 15),
      // color: Colors.amber,
      child: Column(
        children: [
          SizedBox(
            height: 210,
            child: PageView.builder(
              itemCount: 4,
              // if i don't want smooth animation.
              // onPageChanged: (index) => _updatePosition(index),
              controller: _pageController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          "assets/images/room1.avif",
                          height: 210,
                          // width: 250,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: SmallText(
                          text: "Image 1",
                          color: AppColours.white,
                          fontsize: 10,
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
              activeColor: Colors.blue.shade400,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
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
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Luxury King Suite"),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.star_outline,
                  color: const Color.fromARGB(255, 230, 182, 6),
                  size: 18,
                ),
                SizedBox(width: 5),
                SmallText(text: "4.8(245 Reviews)", fontsize: 13),
              ],
            ),
            SizedBox(height: 5),
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
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Room Features"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
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
      width: 150,
      child: Row(
        children: [
          Icon(
            iconData,
            color: const Color.fromARGB(255, 230, 182, 6),
            size: 18,
          ),
          SizedBox(width: 5),
          SmallText(text: text, fontsize: 15),
        ],
      ),
    );
  }

  Widget _priceDetailSection() {
    return Card(
      color: AppColours.white,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(12),
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Taxes & Fees"),
                SmallText(text: "₦1500"),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Service Fee"),
                SmallText(text: "₦150"),
              ],
            ),
            CustomDivider(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(text: "Total", color: Colors.blue.shade300),
                SubTitleText(text: "₦16650.00", color: Colors.blue.shade300),
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
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(12),
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
                SizedBox(width: 5),
                SizedBox(
                  height: 60,
                  width: 210,
                  child: Wrap(
                    children: [
                      SmallText(
                        text: "Jan 1, 2026 - jan 12, 2026",
                        fontsize: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade200,
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
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Guests"),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Adults"),
                Row(
                  children: [
                    _signBuilder(Icons.remove),
                    SizedBox(width: 20,),
                    SubTitleText(text: '1'),
                    SizedBox(width: 20,),
                    _signBuilder(Icons.add),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: "Children"),
                Row(
                  children: [
                    _signBuilder(Icons.remove),
                    SizedBox(width: 20,),
                    SubTitleText(text: "0"),
                    SizedBox(width: 20,),
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
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade400, width: 1.7),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Center(child: Icon(iconData, color: Colors.blue.shade400)),
    );
  }

  Widget _bookRoomButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 300,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.blue.shade400,
        ),
        child: Center(
          child: SmallText(text: "Book Now - ₦16550", color: AppColours.white, fontsize: 13),
        )
          
      ),
    );
  }
}
