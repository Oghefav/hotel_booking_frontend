import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/bigtext.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            _appBarSection(),
            CustomDivider(),
            _searchSearch(),
            _quickFilterSection(),
            _featuredHoteSection(),
          ],
        ),
      ),
    );
  }

  Widget _appBarSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blue.shade500,
            ),
            child: Center(
              child: IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: Icon(
                  Icons.apartment_outlined,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 40),
                ),
                CircleAvatar(
                  radius: 25,
                  foregroundColor: Colors.purple.shade200,
                  backgroundImage: AssetImage('assets/images/male_avatar.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchSearch() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColours.white,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textFieldContainer(
              400,
              Icon(Icons.location_on_outlined),
              "where do you want to stay ?",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldContainer(
                  170,
                  Icon(Icons.calendar_month_outlined),
                  "Dates",
                ),
                _textFieldContainer(
                  170,
                  Icon(Icons.people_alt_outlined),
                  "Guests",
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue.shade500,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search, color: AppColours.white),
                  Text(
                    "Find Hotels",
                    style: TextStyle(
                      color: AppColours.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldContainer(double width, Widget prefixIcon, String helpText) {
    return Container(
      width: width,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          prefixIcon,
          SizedBox(width: 5),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: helpText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
              style: TextStyle(decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickFilterSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bigtext(text: "Quick Filters"),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                // Use choiceChip after connecting to server
                _chipBuilder(text: "Popular", color: Colors.blue.shade400),
                _chipBuilder(text: "Luxury"),
                _chipBuilder(text: "Boutique"),
                _chipBuilder(text: "Budget-Friendly"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipBuilder({required String text, Color? color}) {
    return ActionChip(
      side: BorderSide(color: Colors.grey.shade700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      label: Text(text),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      backgroundColor: color,
    );
  }

  Widget _featuredHoteSection() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bigtext(text: "Featured Hotels"),
          SizedBox(height: 10),
          SingleChildScrollView(
            
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 15,
              direction: Axis.horizontal,
              children: List.generate(3, (index) {
                return Container(
                  
                  height: 270,
                  width: 280,
                  decoration: BoxDecoration(
                    color: AppColours.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.asset("assets/images/hotel1.webp", height: 200, width: 280, fit: BoxFit.fill,)),
                              Positioned(
                                top: 15,
                                right: 15,
                                child: Icon(Icons.favorite_border, color: AppColours.white, size: 25,)),
                                Positioned(
                                  bottom: 40,
                                  left: 10,
                                  child: Text("Gordon Hotel", style: TextStyle(wordSpacing:5, fontSize: 25, fontWeight: FontWeight.bold),)),
                                Positioned(
                                  bottom: 15,
                                  left: 10,
                                  child: Row(
                                  children: [
                                    Icon(Icons.star_border_outlined, color: AppColours.white,),
                                    SizedBox(width: 5,),
                                    Text("3.5", style: TextStyle(color: AppColours.white, fontSize: 18),)
                                  ],
                                ))

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text("Nsukka, Enugu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₦24000",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade300, fontSize: 25), ),
                                Text("Per Night", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
                              ],
                            )
                          ],
                        ),

                      )
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
}
