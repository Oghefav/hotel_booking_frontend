import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';

abstract class LocalHotelState {
  final String? error;
  final List<HotelEntity>? hotels;
  LocalHotelState({this.error, this.hotels,});
}

class LocalHotelLoading extends LocalHotelState{  
  LocalHotelLoading();
}

class LocalHotelSuccess extends LocalHotelState{
  LocalHotelSuccess(List<HotelEntity>? hotels,) : super(hotels: hotels,);
}