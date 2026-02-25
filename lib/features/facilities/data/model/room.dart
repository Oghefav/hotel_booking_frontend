import 'package:hotel_booking_app/features/facilities/domain/entities/room/rooms.dart';

class RoomModel extends RoomEntity{
  const RoomModel({
    required super.roomId, 
    required super.hotel,
    required super.features,
    required super.price,
    required super.roomType,

  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      hotel: json['hotel'] ?? '',
      roomId: json['room_id'] ?? '',
      roomType: json['room_type'] ?? '',
      price: double.parse(json['price'].toString()),
      features: List<String>.from(json['features'] ?? []),
    );
  }
}