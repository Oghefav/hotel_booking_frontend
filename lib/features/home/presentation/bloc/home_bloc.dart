import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/facilities/domain/usecase/hotel.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_event.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final GetHotelUsecase _getHotelUsecase;
  HomeBloc(this._getHotelUsecase) : super(const HomeLoading()){
    print("DEBUG: HomeBloc was created!");
    on<FetchHotels>(onFetchHotels);
  }

  void onFetchHotels(FetchHotels fetchHotels, Emitter<HomeState> emit) async{
    final dataState = await _getHotelUsecase(params: fetchHotels.category);

    if (dataState is DataSuccess){
      emit(HomeSuccess(dataState.data!));
    }

    if (dataState is DataFailed){
      String error = dataState.error.toString();
      emit(HomeFailed(error));
    }
  }
}