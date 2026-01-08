import 'package:get/get_navigation/get_navigation.dart';
import 'package:hotel_booking_app/pages/common/login_screen.dart';
import 'package:hotel_booking_app/pages/customer/booking_confirmation_screen.dart';
import 'package:hotel_booking_app/pages/customer/check_out_screen.dart';
import 'package:hotel_booking_app/pages/customer/customer_home_page.dart';
import 'package:hotel_booking_app/pages/customer/hotel_details_screen.dart';
import 'package:hotel_booking_app/pages/customer/profile_and_booking_screen.dart';
import 'package:hotel_booking_app/pages/customer/rating_and_review_screen.dart';
import 'package:hotel_booking_app/pages/customer/register_screen.dart';
import 'package:hotel_booking_app/pages/customer/room_booking_screen.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String bookingConfirmationPage = '/bookingConfirmationPage';
  static const String checkOutPage = '/checkOutPage';
  static const String customerHomePage = '/customerHomePage';
  static const String hotelDetailPage = '/hotelDetailPage';
  static const String profilePage = '/profilePage';
  static const String ratingReviewPage = '/ratingReviewPage';
  static const String registerPage = '/registerPage';
  static const String roomBookingPage = '/roomBookingPage';
  static const String loginPage = '/loginPage';

  static final List<GetPage> routes = [
    GetPage(name: homePage, page: () => CustomerHomePage()),
    GetPage(
      name: bookingConfirmationPage,
      page: () => BookingConfirmationScreen(),
    ),
    GetPage(name: checkOutPage, page: () => CheckOutScreen()),
    GetPage(name: customerHomePage, page: () => CustomerHomePage()),
    GetPage(name: hotelDetailPage, page: () => HotelDetailsScreen()),
    GetPage(name: profilePage, page: () => ProfileAndBookingScreen()),
    GetPage(name: ratingReviewPage, page: () => RatingAndReviewScreen()),
    GetPage(name: registerPage, page: () => RegisterScreen()),
    GetPage(name: roomBookingPage, page: () => RoomBookingScreen()),
    GetPage(name: loginPage, page: () => LoginScreen()),
  ];
}
