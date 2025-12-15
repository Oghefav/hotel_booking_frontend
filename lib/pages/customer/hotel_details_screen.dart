import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true
        ,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              leading: Icon(Icons.arrow_back_ios, color: Colors.grey, weight: 10),
              pinned: true,
              
              flexibleSpace: FlexibleSpaceBar(
                title: Bigtext(text: "The Grand Hotel"),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _hotelImageSection(),
                _descriptionSection(),
                _avaliableRoomSection(),
                _reviewSection(),
                SizedBox(height: 15,),
                CustomDivider(),
                SizedBox(height: 10,),
                _viewRoomSection(),
                SizedBox(height: 30,),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hotelImageSection() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: AppColours.white),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          children: List.generate(3, ((int index) {
            return Container(
              margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  "assets/images/hotel2.webp",
                  height: 210,
                  width: 300,
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
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bigtext(text: "The Grand Hotel"),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.blue.shade400,
                size: 18,
              ),
              SmallText(text: "123 Onuiyi Street, Nsukka"),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Icon(Icons.star_outline, color: Colors.blue.shade400, size: 18),
              Text(
                "4.8 (120 Reviews)",
                style: TextStyle(
                  color: Colors.blue.shade500,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          SubTitleText(text: "Description"),
          Wrap(
            children: [
              SmallText(
                text:
                    "Experience unparalled luxury at The Grand Hotel, a landmark of sophisatication located in the heart of Nsukka. Boasting breathtaking views of the city skyline and the tranquil ocean, our hotel offers and exquiste blend of classic elegance and modern comfort. Each room is meticulously designed with plusd furnishings and state-of-the-art amenities to ensure a memeroble stay, indulge in our world-class dining, rejuvenate at our spa, or unwind by the pristine poolside. The Grand Hotel is more than just a place to stay; it's an experience.",
              ),
            ],
          ),
          SizedBox(height: 10),
          SubTitleText(text: "Amentites"),
          Wrap(
            // modify after connecting to server
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
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColours.white),
      ),
      shadowColor: Colors.transparent,
      backgroundColor: Color(0x66ECEFF1),
      label: SmallText(text: text, color: Colors.black),
    );
  }

  Widget _avaliableRoomSection() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubTitleText(text: "Available Rooms"),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 15,
              direction: Axis.horizontal,
              children: List.generate(3, (index) {
                return Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColours.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/images/room1.avif",
                            height: 130,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: "Deluxe King Room",
                              color: Colors.black,
                            ),

                            SmallText(
                              text: "₦25000/Night",
                              color: Colors.blue.shade400,
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 180,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.blue.shade400,
                              ),
                              child: Center(
                                child: SmallText(
                                  text: "View Details",
                                  color: AppColours.white,
                                  fontsize: 13,
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: AppColours.white,
      child: Padding(
        padding: EdgeInsets.all(10),
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
                      color: Colors.blue.shade400,
                      size: 18,
                    ),
                    SmallText(
                      text: "4.8/5",
                      fontsize: 12,
                      color: Colors.blue.shade400,
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
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0x66ECEFF1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 100),
                  Icon(CupertinoIcons.square_pencil, color: Colors.black),
                  SizedBox(width: 5),
                  SmallText(
                    text: "Write a Review",
                    color: Colors.black,
                    fontsize: 13,
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
          child: SmallText(text: "View Rooms", color: AppColours.white, fontsize: 13),
        )
          
      ),
    );
  }
}
