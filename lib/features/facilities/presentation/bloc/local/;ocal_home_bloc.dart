import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/features/facilities/domain/usecase/hotel.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/local_hotel_state.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/ocal_hotel_event.dart';

class LocalHotelBloc extends Bloc<LocalHotelEvent, LocalHotelState> {
  final GetSavedHotelUsecase _getSavedHotelUsecase;
  final DeleteHotelUsecase _deleteHotelUsecase;
  final SaveHotelUsecase _saveHotelUsecase;

  LocalHotelBloc(
    this._deleteHotelUsecase,
     this._getSavedHotelUsecase, 
     this._saveHotelUsecase) :
      super( LocalHotelLoading()){
    on<GetSavedHotel>(onGetSavedHotel);
    on<SaveHotel>(onSaveHotel);
    on<DeleteHotel>(onDeleteHotel);
  } 

  void onGetSavedHotel(GetSavedHotel event, Emitter<LocalHotelState> emit) async{
    final hotels = await _getSavedHotelUsecase();
    emit(LocalHotelSuccess(hotels));
  }

  void onSaveHotel(SaveHotel event, Emitter<LocalHotelState> emit) async{
    await _saveHotelUsecase(params: event.hotel);
    final hotels = await _getSavedHotelUsecase();

    emit(LocalHotelSuccess(hotels));
  }

  void onDeleteHotel(DeleteHotel event, Emitter<LocalHotelState> emit) async{
    await _deleteHotelUsecase(params: event.hotel);
    final hotels = await _getSavedHotelUsecase();
    emit(LocalHotelSuccess(hotels));
  }
}