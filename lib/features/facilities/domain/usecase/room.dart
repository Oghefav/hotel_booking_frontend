import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/core/usecase/usecase.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/room/rooms.dart';
import 'package:hotel_booking_app/features/facilities/domain/repository/facility_repository.dart';

class GetRooms implements UseCase<DataState<List<RoomEntity>>, String?> {

  final FacilityRepository _facilityRepository;

  GetRooms(this._facilityRepository);

  @override
  Future<DataState<List<RoomEntity>>> call({String? params}){
    return _facilityRepository.getRooms(params!);
  }
}