import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/login_params.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/register_params.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> register(RegisterParams data);
  
  Future<DataState<UserEntity>> login(LoginParams data);

  Future<DataState<UserEntity>> googleLogin();
}
