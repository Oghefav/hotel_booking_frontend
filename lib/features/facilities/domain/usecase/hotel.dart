import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/core/usecase/usecase.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotel_location_params.dart';
import 'package:hotel_booking_app/features/facilities/domain/repository/facility_repository.dart';

class GetHotelUsecase implements UseCase<DataState<HotelEntity>, void>{
  final FacilityRepository _facilityRepository;

  GetHotelUsecase(this._facilityRepository);

  @override
  Future<DataState<HotelEntity>> call({void params}){
    return _facilityRepository.getHotels();
  }
}

class GetHotelByLocationUsecase implements UseCase<DataState<HotelEntity>, HotelLocationParams> {
  final FacilityRepository _facilityRepository;

  GetHotelByLocationUsecase(this._facilityRepository);

  @override
  Future<DataState<HotelEntity>> call({ HotelLocationParams? params}){
    return _facilityRepository.getHotelsByLocation(params!);
  }
}