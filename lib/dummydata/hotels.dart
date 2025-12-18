import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/model/hotel_model.dart';

List<HotelModel> hotels = [
  HotelModel(
    name: "The Grand Regal Hotel",
    city: "Asaba",
    country: "Nigeria",
    price: 30000,
    features: ['Free Wi-Fi', 'Pool', 'Spa', 'Restaurant', 'Fitness Center'],
    guestsMax: 3,
    avgRating: 4.8,
    image: 'assets/images/hotel7.jpg',
  ),
  HotelModel(
    name: 'City View Inn',
    city: 'Yenegoa',
    country: 'Nigeria',
    price: 15000,
    features: ['Free Parking', 'Gym', 'breakfast', 'Meeting Rooms'],
    guestsMax: 2,
    avgRating: 4.7,
    image: 'assets/images/hotel2.webp',
  ),
  HotelModel(
    name: 'Boutique Stay',
    city: 'Ibada',
    country: 'Nigeria',
    price: 20000,
    features: ['Pet-Friendly', 'Bar', 'Room Service', 'Historic Building'],
    guestsMax: 3,
    avgRating: 4.7,
    image: 'assets/images/hotel3.jpg',
  ),
  HotelModel(
    name: 'Mountain Retreat',
    city: 'Makurdi',
    country: 'Nigeria',
    price: 34000,
    features: ['Free Parking', 'Gym', 'breakfast', 'Meeting Rooms'],
    guestsMax: 2,
    avgRating: 4.9,
    image: 'assets/images/hotel4.jpg',
  ),
  HotelModel(
    name: 'BeachFront Paradise',
    city: 'Abuja',
    country: 'Nigeria',
    price: 70000,
    features: ['Free Parking', 'Gym', 'breakfast', 'Meeting Rooms'],
    guestsMax: 3,
    avgRating: 4.6,
    image: 'assets/images/hotel5.jpg',
  ),
  HotelModel(
    name: 'The Alt',
    city: 'Ughelli',
    country: 'Nigeria',
    price: 50000,
    features: ['Kids Club', 'Fitness Center', 'Restaurant', 'Bar'],
    guestsMax: 4,
    avgRating: 4.3,
    image: 'assets/images/hotel6.jpg',
  ),
];

List<BookingModel> bookings = [
  BookingModel(
    checkInDate: DateTime(2024, 7, 20),
    checkOutDate: DateTime(2024, 7, 25),hotelName: 'The Grand Regal Hotel', roomType: 'Deluxe Suite', bookingStatus: 'Confirmed', roomImage: 'assets/images/room1.avif',
  ),
  BookingModel(
    checkInDate: DateTime(2024, 8, 5),
    checkOutDate: DateTime(2024, 8, 10), hotelName: 'Boutique Stay', roomType: 'Standard Room', bookingStatus: 'Pending', roomImage: 'assets/images/room2.jpg',
  ),
  BookingModel(hotelName: 'City View Inn', roomType: 'Executive Room', checkInDate: DateTime(2024, 9, 15), checkOutDate: DateTime(2024, 9, 20), bookingStatus: 'Cancelled', roomImage: 'assets/images/room3.jpg',
  ),
  BookingModel(hotelName: 'Mountain Retreat', roomType: 'Family Suite', checkInDate: DateTime(2024, 10, 1), checkOutDate: DateTime(2024, 10, 6), bookingStatus: 'Completed', roomImage: 'assets/images/room4.jpg',
  ),
];
