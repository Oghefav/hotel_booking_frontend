import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final String hotel;
  final String roomId;
  final String roomType;
  final double price;
  final List<String> features;

  const RoomEntity({
    required this.hotel,
    required this.roomId,
    required this.roomType,
    required this.price,
    required this.features,
  });

  @override
  List<Object> get props => [roomId];
}