import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_app/core/constants/constants.dart';
import 'package:hotel_booking_app/core/resources/auth_interceptor.dart';
import 'package:hotel_booking_app/features/auth/data/data%20source/local/auth_local_datastore.dart';
import 'package:hotel_booking_app/features/auth/data/data%20source/remote/auth_api_service.dart';
import 'package:hotel_booking_app/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:hotel_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/google_login.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/login.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/register.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:hotel_booking_app/features/facilities/data/data_source/local/DAO/app_database.dart';
import 'package:hotel_booking_app/features/facilities/data/data_source/remote/facility_api_service.dart';
import 'package:hotel_booking_app/features/facilities/data/repository/facility_repository_impl.dart';
import 'package:hotel_booking_app/features/facilities/domain/repository/facility_repository.dart';
import 'package:hotel_booking_app/features/facilities/domain/usecase/hotel.dart';
import 'package:hotel_booking_app/features/facilities/domain/usecase/room.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/;ocal_home_bloc.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;
Future<void> dependenciesInjection() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // external
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerSingleton<AppDatabase>(database);

  // network
  sl.registerLazySingleton<Dio>((){
    final dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(sl<AuthInterceptor>(), );
    return dio;
  });
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: baseUrl,)), instanceName: 'refreshDio');
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl(), sl(instanceName: 'refreshDio')));

  
  // datasources
  sl.registerLazySingleton<AuthApiService>(() =>AuthApiService(sl()));
  sl.registerLazySingleton<FacilityApiService>(() => FacilityApiService(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() =>AuthLocalDataSourceImpl(sl()));

  // repositorires
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation(sl(), sl()));
  sl.registerLazySingleton<FacilityRepository>(() => FacilityRepositoryImpl(sl(), sl()));

  // usecases
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  sl.registerLazySingleton<GoogleLoginUsecase>(() => GoogleLoginUsecase(sl()));
  sl.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(sl()));
  sl.registerLazySingleton<GetHotelUsecase>(() => GetHotelUsecase(sl()));
  sl.registerLazySingleton<GetHotelByLocationUsecase>(() => GetHotelByLocationUsecase(sl()));
  sl.registerLazySingleton<GetRooms>(() => GetRooms(sl()));
  sl.registerLazySingleton<GetSavedHotelUsecase>(()=> GetSavedHotelUsecase(sl()));
  sl.registerLazySingleton<DeleteHotelUsecase>(()=> DeleteHotelUsecase(sl()));
  sl.registerLazySingleton<SaveHotelUsecase>(()=> SaveHotelUsecase(sl()));

  // blocs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => GoogleLoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => LocalHotelBloc(sl(), sl(), sl()));
  
}
