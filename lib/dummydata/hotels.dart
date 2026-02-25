import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/model/hotel_model.dart';

List<HotelModel> hotels = [
  HotelModel(
    name: "The Grand Regal Hotel",
    city: "Asaba",
    country: "Nigeria",
    // price: 30000,
    features: ['Free Wi-Fi', 'Pool', 'Spa', 'Restaurant', 'Fitness Center'],
    guestsMax: 3,
    avgRating: 4.8,
    image: 'assets/images/hotel7.jpg',
    description: 'Experience luxury and comfort at The Grand Regal Hotel, located in the heart of Asaba. Enjoy our spacious rooms, world-class amenities, and exceptional service for an unforgettable stay.',
  ),
  HotelModel(
    name: 'City View Inn',
    city: 'Yenegoa',
    country: 'Nigeria',
    // price: 15000,
    features: ['Free Parking', 'Gym', 'breakfast', 'Meeting Rooms'],
    guestsMax: 2,
    avgRating: 4.7,
    image: 'assets/images/hotel2.webp',
    description: 'City View Inn offers a comfortable and convenient stay in Yenegoa. With modern amenities, friendly staff, and a prime location, it’s the perfect choice for both business and leisure travelers.',
  ),
  HotelModel(
    name: 'Boutique Stay',
    city: 'Ibada',
    country: 'Nigeria',
    // price: 20000,
    features: ['Pet-Friendly', 'Bar', 'Room Service', 'Historic Building'],
    guestsMax: 3,
    avgRating: 4.7,
    image: 'assets/images/hotel3.jpg',
    description: 'Boutique Stay in Ibada offers a unique and charming experience with its historic building and personalized service. Enjoy comfortable rooms, a cozy atmosphere, and convenient access to local attractions.'
  ),
  HotelModel(
    name: 'Mountain Retreat',
    city: 'Makurdi',
    country: 'Nigeria',
    // price: 34000,
    features: ['Free Parking', 'Gym', 'breakfast', 'Meeting Rooms'],
    guestsMax: 2,
    avgRating: 4.9,
    image: 'assets/images/hotel4.jpg',
    description: 'Mountain Retreat offers a peaceful and scenic environment in Makurdi. With comfortable rooms, stunning views, and excellent service, it is the perfect destination for travelers seeking tranquility and natural beauty.'
  ),
  HotelModel(
    name: 'BeachFront Paradise',
    city: 'Abuja',
    country: 'Nigeria',
    // price: 70000,
    features: ['Free Parking', 'Gym', 'breakfast', 'Meeting Rooms'],
    guestsMax: 3,
    avgRating: 4.6,
    image: 'assets/images/hotel5.jpg',
    description: 'BeachFront Paradise offers stunning ocean views and luxurious amenities in the heart of Abuja. Enjoy our premium rooms, world-class service, and breathtaking surroundings for an unforgettable vacation experience.'
  ),
  HotelModel(
    name: 'The Alt',
    city: 'Ughelli',
    country: 'Nigeria',
    // price: 50000,
    features: ['Kids Club', 'Fitness Center', 'Restaurant', 'Bar'],
    guestsMax: 4,
    avgRating: 4.3,
    image: 'assets/images/hotel6.jpg',
    description: 'The Alt offers a unique blend of modern comfort and traditional charm in Ughelli. With elegant rooms, excellent service, and a prime location, it provides an ideal retreat for travelers seeking both relaxation and convenience.'
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
