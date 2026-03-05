import 'package:hotel_booking_app/core/resources/image_url_format.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'hotels', primaryKeys: ['id'])
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
    super.isFavorite
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesList = json['images'] as List? ?? [];
    return HotelModel(
      id: json['public_id'] ?? '',
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      features: List<String>.from(json['amenities'] ?? []),
      description: json['description'] ?? '',
      guestsMax: json['max_guests'] ?? 0,
      avgRating: (json['average_rating'] ?? 0).toDouble(),
      image: imagesList.isNotEmpty ? imageUrlFormatter(json['images'][0].toString()) : ''
    );
  }

  factory HotelModel.fromEntity(HotelEntity entity){
    return HotelModel(id: entity.id
    , name: entity.name, city: entity.city, avgRating: entity.avgRating, country: entity.country, description: entity.description, features: entity.features, guestsMax: entity.guestsMax, image: entity.image, isFavorite: entity.isFavorite);
  }

  HotelModel copyWith({String? id,
    String? name,
    String? city,
    double? avgRating,
    String? country,
    String? description,
    List<String>? features,
    int? guestsMax,
    String? image,
    bool? isFavorite,}){
      return HotelModel(id: id ?? this.id, name: name ?? this.name, city: city ?? this.city, avgRating: avgRating ?? this.avgRating, country: country ?? this.country, description: description ?? this.description, features: features ?? this.features, guestsMax: guestsMax ?? this.guestsMax, image: image ?? this.image, isFavorite: isFavorite ?? isFavorite!);
    }
}