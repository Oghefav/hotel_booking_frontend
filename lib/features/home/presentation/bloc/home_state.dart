import 'package:equatable/equatable.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
abstract class HomeState  extends Equatable{
  final List<HotelEntity>? hotels;
  final String? error;
  const HomeState({this.error, this.hotels});

  @override
  List<Object?> get props => [hotels, error];
}

class HomeLoading extends HomeState{
  const HomeLoading();
}

class HomeSuccess extends HomeState{
  const HomeSuccess(List<HotelEntity> hotels) : super(hotels: hotels);
}

class HomeFailed extends HomeState{
  const HomeFailed(String error) : super(error: error);
}