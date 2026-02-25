import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';

class HotelModel extends HotelEntity{
  const HotelModel({
    required super.id,
    required super.name,
    required super.city,
    required super.avgRating,
    required super.country,
    required  super.description,
    required super.features,
    required super.guestsMax,
    required super.image,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['public_id'] ?? '',
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      features: List<String>.from(json['amenities'] ?? []),
      description: json['description'] ?? '',
      guestsMax: json['max_guests'] ?? 0,
      avgRating: (json['average_rating'] ?? 0).toDouble(),
      image: (json['images'][0] ?? ''),
    );
  }
}