import 'dart:core';

import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotel_location_params.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/room/rooms.dart';

abstract class FacilityRepository {

  Future<DataState<List<HotelEntity>>> getHotels(String? category);

  Future<DataState<List<RoomEntity>>> getRooms(String hotelId);

  Future<DataState<List<HotelEntity>>> getHotelsByLocation(HotelLocationParams params);

  Future<List<HotelEntity>> getSavedHotels();

  Future<void> saveHotel(HotelEntity hotel);

  Future<void> deleteHotel(HotelEntity hotel);

}