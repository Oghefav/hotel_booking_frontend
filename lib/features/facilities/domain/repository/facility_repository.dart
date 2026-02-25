import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotel_location_params.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/room/rooms.dart';

abstract class FacilityRepository {

  Future<DataState<HotelEntity>> getHotels();
  Future<DataState<RoomEntity>> getRooms(String hotelId);
  Future<DataState<HotelEntity>> getHotelsByLocation(HotelLocationParams params);

}