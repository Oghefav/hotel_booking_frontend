import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/core/usecase/usecase.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotel_location_params.dart';
import 'package:hotel_booking_app/features/facilities/domain/repository/facility_repository.dart';

class GetHotelUsecase implements UseCase<DataState<List<HotelEntity>>, String?>{
  final FacilityRepository _facilityRepository;

  GetHotelUsecase(this._facilityRepository);

  @override
  Future<DataState<List<HotelEntity>>> call({String? params}){
    return _facilityRepository.getHotels(params);
  }
}

class GetHotelByLocationUsecase implements UseCase<DataState<List<HotelEntity>>, HotelLocationParams> {
  final FacilityRepository _facilityRepository;

  GetHotelByLocationUsecase(this._facilityRepository);

  @override
  Future<DataState<List<HotelEntity>>> call({ HotelLocationParams? params}){
    return _facilityRepository.getHotelsByLocation(params!);
  }
}

class GetSavedHotelUsecase implements UseCase<List<HotelEntity>, void> {
  final FacilityRepository _facilityRepository;
  GetSavedHotelUsecase(this._facilityRepository);

  @override
  Future<List<HotelEntity>> call({void params}) {
    return _facilityRepository.getSavedHotels();
  }
}

class SaveHotelUsecase implements UseCase<void, HotelEntity> {
  final FacilityRepository _facilityRepository;
  SaveHotelUsecase(this._facilityRepository);

  @override 
  Future<void> call({HotelEntity? params}){
    return _facilityRepository.saveHotel(params!);
  }
}

class DeleteHotelUsecase implements UseCase<void, HotelEntity> {
  final FacilityRepository _facilityRepository;
  DeleteHotelUsecase(this._facilityRepository);

  @override
  Future<void> call({HotelEntity? params}){
    return _facilityRepository.deleteHotel(params!);
  }
}
