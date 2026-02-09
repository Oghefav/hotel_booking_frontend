import 'package:dio/dio.dart';
import 'package:hotel_booking_app/core/constants/constants.dart';
import 'package:hotel_booking_app/features/auth/data/model/login.dart';
import 'package:hotel_booking_app/features/auth/data/model/register.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth/customer-registration/')
  Future<HttpResponse<dynamic>> register({@Body() required RegisterModel data});

  @POST('/auth/login/')
  Future<HttpResponse<dynamic>> login({@Body() required LoginModel data});

  @POST('/auth/google-auth/')
  Future<HttpResponse<dynamic>> googleLogin({@Body() required Map<String, dynamic> body});

}
