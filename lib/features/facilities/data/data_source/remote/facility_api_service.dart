import 'package:dio/dio.dart';
import 'package:hotel_booking_app/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
part 'facility_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FacilityApiService{
  factory FacilityApiService(Dio dio) = _FacilityApiService;

  @GET('/hotel/hotel/')
  Future<HttpResponse<dynamic>> getHotels(
  );

  @GET('/hotel/search_by_location/')
  Future<HttpResponse<dynamic>> getHotelsByLocation({
    @Query('country') String? country,
    @Query('city') String? city,
  });

  @GET('/hotel/hotel/rooms/')
  Future<HttpResponse<dynamic>> getHotelRooms({
    @Query('hotel_id') required hotelId,
  });
  
}
