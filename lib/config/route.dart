import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/depencies_injection.dart';
import 'package:hotel_booking_app/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/;ocal_home_bloc.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:hotel_booking_app/pages/customer/booking_confirmation_screen.dart';
import 'package:hotel_booking_app/pages/customer/check_out_screen.dart';
import 'package:hotel_booking_app/features/home/presentation/ui/customer_home_page.dart';
import 'package:hotel_booking_app/pages/customer/hotel_details_screen.dart';
import 'package:hotel_booking_app/features/home/presentation/ui/persistent_nav_bar.dart';
import 'package:hotel_booking_app/pages/customer/profile_and_booking_screen.dart';
import 'package:hotel_booking_app/pages/customer/rating_and_review_screen.dart';
import 'package:hotel_booking_app/features/auth/presentation/pages/register_screen/register_screen.dart';
import 'package:hotel_booking_app/pages/customer/room_booking_screen.dart';

class AppRoutes {
  static const String homePage = '/homepage';
  static const String bookingConfirmationPage = '/bookingConfirmationPage';
  static const String checkOutPage = '/checkOutPage';
  static const String customerHomePage = '/customerHomePage';
  static const String hotelDetailPage = '/hotelDetailPage';
  static const String profilePage = '/profilePage';
  static const String ratingReviewPage = '/ratingReviewPage';
  static const String registerPage = '/registerPage';
  static const String roomBookingPage = '/roomBookingPage';
  static const String loginPage = '/loginPage';

  // Standard Flutter Route Map
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      bookingConfirmationPage: (context) => const BookingConfirmationScreen(),
      checkOutPage: (context) => const CheckOutScreen(),
      homePage: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
          BlocProvider<LocalHotelBloc>(create: (context)=> sl<LocalHotelBloc>())
        ],
        child: const PersistentNavBar(),
      ),
      customerHomePage: (context) => BlocProvider(
        create: (context)=> sl<HomeBloc>(),
        child: CustomerHomePage(),
      ),
      hotelDetailPage: (context) => const HotelDetailsScreen(),
      profilePage: (context) => const ProfileAndBookingScreen(),
      ratingReviewPage: (context) => const RatingAndReviewScreen(),
      registerPage: (context) => const RegisterScreen(),
      roomBookingPage: (context) => const RoomBookingScreen(),
      loginPage: (context) => const LoginScreen(),
    };
  }
}