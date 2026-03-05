import 'package:dio/dio.dart';
import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/facilities/data/data_source/local/DAO/app_database.dart';
import 'package:hotel_booking_app/features/facilities/data/data_source/remote/facility_api_service.dart';
import 'package:hotel_booking_app/features/facilities/data/model/hotel.dart';
import 'package:hotel_booking_app/features/facilities/data/model/room.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotel_location_params.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:hotel_booking_app/features/facilities/domain/repository/facility_repository.dart';
import 'package:retrofit/retrofit.dart';

class FacilityRepositoryImpl implements FacilityRepository{
  final FacilityApiService _facilityApiService;
  final AppDatabase _appDatabase;
  final Map<String, List<HotelModel>> cache= {};
  FacilityRepositoryImpl(this._facilityApiService, this._appDatabase);

  @override
  Future<DataState<List<HotelModel>>> getHotels(String? category)async{
    try {
      if (cache.containsKey(category)){
        return DataSuccess(cache[category]!);
      }
      final newCategory = category == 'all' ? null : category;
      final HttpResponse httpResponse =  await _facilityApiService.getHotels(newCategory);

      final List<String> localFavoriteIds = await _appDatabase.hotelDao.getAllFavouriteIds();
      if (httpResponse.response.statusCode == 200){
        final List<dynamic> data = httpResponse.data;
        final List<HotelModel> hotels = data.map<HotelModel>((item){
          final hotel =  HotelModel.fromJson(item as Map<String, dynamic>);

          bool isSavedLocally = localFavoriteIds.contains(hotel.id);
          return hotel.copyWith(isFavorite: isSavedLocally);
        }).toList();
        
        if (category != null){
          cache[category] = hotels;
        }
        return DataSuccess(hotels);
        } else {
          return DataFailed(DioException(requestOptions: httpResponse.response.requestOptions,
          error:  httpResponse.response.statusMessage,
          type:  DioExceptionType.badResponse));
        }

    } on DioException catch (e){
          return DataFailed(e);
      }
  }
    @override
    Future<DataState<List<HotelModel>>> getHotelsByLocation(HotelLocationParams params) async{
    try {
        final HttpResponse httpResponse = await _facilityApiService.getHotelsByLocation(city: params.city, country: params.country);

        if (httpResponse.response.statusCode == 200){
        final data = httpResponse.data;
      final List<HotelModel> hotels = [];
      hotels.addAll(data);
      return DataSuccess(hotels); 
        }else {
        return DataFailed(DioException(requestOptions: httpResponse.response.requestOptions,
        error:  httpResponse.response.statusMessage,
        type:  DioExceptionType.badResponse));
      }
    }on DioException catch (e){
        return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<RoomModel>>> getRooms(String hotelId) async{
    try {

        final HttpResponse httpResponse = await _facilityApiService.getHotelRooms(hotelId: hotelId);

        if (httpResponse.response.statusCode == 200){
            final data = httpResponse.response.data;
            final List<RoomModel> rooms = [];
            rooms.addAll(data);

            return DataSuccess(rooms);
        } else {
            return DataFailed(DioException(
                error: httpResponse.response.statusMessage,
                requestOptions: httpResponse.response.requestOptions,
                type: DioExceptionType.badResponse
            ));
        }
    } on DioException catch(e){
        return DataFailed(e);
    }
  }

  @override
  Future<List<HotelModel>> getSavedHotels(){
    return _appDatabase.hotelDao.getHotels();
  }

  @override
  Future<void> saveHotel(HotelEntity hotel){
    return  _appDatabase.hotelDao.insertHotel(HotelModel.fromEntity(hotel).copyWith(isFavorite: true));
  }

  @override 
  Future<void> deleteHotel(HotelEntity hotel){
    return _appDatabase.hotelDao.insertHotel(HotelModel.fromEntity(hotel).copyWith(isFavorite: false));
  }
}