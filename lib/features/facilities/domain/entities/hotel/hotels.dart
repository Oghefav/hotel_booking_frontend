import 'package:equatable/equatable.dart';
class HotelEntity extends Equatable {
  final String id;
  final String name;
  final String city;
  final String country;
  final List<String> features;
  final int guestsMax;
  final double avgRating;
  final String image;
  final String description;
  final bool isFavorite;

  const HotelEntity({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.features,
    required this.guestsMax,
    required this.avgRating,
    required this.image,
    required this.description,
    this.isFavorite = false
  });

  @override
  List<Object> get props {
    return [id, name , isFavorite];
  }
}