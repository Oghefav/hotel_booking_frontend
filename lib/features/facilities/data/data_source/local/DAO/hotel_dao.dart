import 'package:floor/floor.dart';
import 'package:hotel_booking_app/features/facilities/data/model/hotel.dart';
@dao
abstract class HotelDao {
  @insert
  Future<void> insertHotel(HotelModel hotel);

  @delete
  Future<void> deleteHotel(HotelModel hotel);

  @Query('SELECT * FROM hotels')
  Future<List<HotelModel>> getHotels();

  @Query('SELECT id From hotels')
    Future<List<String>> getAllFavouriteIds();
}