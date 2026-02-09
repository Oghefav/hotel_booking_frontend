

 import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_app/features/auth/data/data%20source/remote/auth_api_service.dart';
import 'package:hotel_booking_app/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:hotel_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/google_login.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/login.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/register.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_bloc.dart';

final sl = GetIt.instance;
Future<void> dependenciesInjection() async {
 

  // dependencies
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepoImplementation(sl()));

  // blocs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => GoogleLoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));

  // usecases
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<GoogleLoginUsecase>(GoogleLoginUsecase(sl()));
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl()));
}
