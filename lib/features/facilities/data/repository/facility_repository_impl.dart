import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/facilities/data/data_source/remote/facility_api_service.dart';
import 'package:hotel_booking_app/features/facilities/data/model/hotel.dart';
import 'package:hotel_booking_app/features/facilities/domain/repository/facilitity_repository.dart';
import 'package:retrofit/retrofit.dart';

// class FacilityRepositoryImpl implements FacilititiesRepository{
//   final FacilityApiService _facilityApiService;

//   FacilityRepositoryImpl(this._facilityApiService);

//   @override
//   Future<DataState<HotelModel>> getHotels()async{
//     final HttpResponse httpResponse = await _facilityApiService.getHotels();

//     if (httpResponse.response.statusCode == 200){
//       final List<HotelModel> hotels = httpResponse.data
//     }

//   }
// }