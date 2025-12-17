import 'package:flutter/material.dart';
import 'package:hotel_booking_app/dummydata/hotels.dart';
import 'package:hotel_booking_app/model/hotel_model.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/icon_text.dart';
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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: SubTitleText(text: "Hotel Listing"),
            actionsPadding: EdgeInsets.only(right: 20),
            leading: Icon(Icons.arrow_back_ios, color: Colors.grey.shade600),
            actions: [Icon(Icons.menu)],
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: FilterHeaderDelegate(
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
        CustomDivider(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _filterAndMapViewIconBuilder(Icons.tune, "Filter & Sort", 140),
              _filterAndMapViewIconBuilder(Icons.map_outlined, "Map View", 120),
            ],
          ),
        ),
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
      height: 50,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 1.2, color: Colors.grey.shade400),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, color: Color.fromARGB(190, 37, 37, 37)),
            SizedBox(width: 5),
            IconText(text: text),
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
          margin: EdgeInsets.only(bottom: 15, right: 20, left: 20, top: 10),
          color: AppColours.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      hotelList[index].image,
                      width: double.maxFinite,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(199, 165, 162, 162),
                      ),
                      child: Icon(Icons.favorite_border_outlined, size: 27),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(160, 11, 11, 11),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_outline,
                              color: const Color.fromARGB(255, 230, 182, 6),
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Bigtext(
                              text: "${hotelList[index].avgRating}",
                              color: AppColours.white,
                              fontsize: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bigtext(
                      text: hotelList[index].name,
                      color: const Color.fromARGB(230, 15, 3, 3),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade700,
                        ),
                        SubTitleText(
                          text:
                              '${hotelList[index].city}, ${hotelList[index].country}',
                          fontsize: 17, color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Bigtext(
                              text: "₦${hotelList[index].price.toInt()}",
                              color: Colors.lightBlue.shade300
                            ),
                            SubTitleText(text: "/night", fontsize: 17, color: Colors.grey.shade600),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            SubTitleText(
                              text:
                                  "Up to ${hotelList[index].guestsMax} guests",
                                  fontsize: 15, color: Colors.grey.shade600
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Wrap(
                      spacing: 10,
                      children: List.generate(features.length, (index) {
                        return Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColours.white),
                          ),
                          backgroundColor: Color.fromARGB(100, 212, 217, 220),
                          label: IconText(text: features[index]),
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
