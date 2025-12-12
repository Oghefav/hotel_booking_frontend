import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/customer/hotel_details_screen.dart';
import 'package:hotel_booking_app/pages/customer/customer_home_page.dart';
import 'package:hotel_booking_app/pages/customer/persistent_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HotelDetailsScreen(),
    );
  }
}

