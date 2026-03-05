import 'package:equatable/equatable.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';

abstract class LocalHotelEvent extends Equatable{
  final HotelEntity? hotel;
  const LocalHotelEvent({this.hotel});

  @override
  List<Object?> get props => [hotel!];
}

class GetSavedHotel extends LocalHotelEvent{
  const GetSavedHotel();
}

class SaveHotel extends LocalHotelEvent{
  const SaveHotel(HotelEntity hotel) : super(hotel: hotel);
}

class DeleteHotel extends LocalHotelEvent {
  const DeleteHotel(HotelEntity hotel)  : super(hotel: hotel);
}