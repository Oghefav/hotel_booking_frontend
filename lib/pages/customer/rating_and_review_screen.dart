import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class RatingAndReviewScreen extends StatelessWidget {
  const RatingAndReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            _appBarSection(),
            CustomDivider(),
            _ratingAndReviewSection(),
          ],
        ),
      ),
    );
  }

  Widget _appBarSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [SubTitleText(text: "Leave a Review"), Icon(Icons.close)],
      ),
    );
  }

  Widget _ratingAndReviewSection() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: "Overall Hotel Rating"),
          SizedBox(height: 8,),
          Row(
            children: [
              Wrap(
                children: List.generate(5, (index) {
                  return Icon(Icons.star_outline_rounded, color: Colors.blue.shade300);
                }),
              ),
              SmallText(text: "(4)"),
              SizedBox(width: 5,),
              SubTitleText(text: "4.3"),
      
            ],
          ),
          SizedBox(height: 15,),
          SmallText(text: "Your Rating"),
          SizedBox(height: 7,),
          Wrap(spacing: 6, children: List.generate(5, (index)=> Icon(Icons.star_outline, color: Colors.grey.shade800, size: 30, )),),
          SizedBox(height: 15,),
          SmallText(text: "Your Review"),
          SizedBox(height: 10,),
          TextField(
            maxLines: 8,
            decoration: InputDecoration(
            hintText: "Share your experience with us...",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey.shade400)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15))
          ),),
          SizedBox(height: 20,),
          Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.blue.shade400,
        ),
        child: Center(
          child: SmallText(text: "Submit Review", color: AppColours.white, fontsize: 20),
        )
          
      ),
    
      
        ],
      ),
    );
  }

}
