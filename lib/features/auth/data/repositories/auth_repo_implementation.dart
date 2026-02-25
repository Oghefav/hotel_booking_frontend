import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/auth/data/data%20source/local/auth_local_datastore.dart';
import 'package:hotel_booking_app/features/auth/data/data%20source/remote/auth_api_service.dart';
import 'package:hotel_booking_app/features/auth/data/model/login.dart';
import 'package:hotel_booking_app/features/auth/data/model/register.dart';
import 'package:hotel_booking_app/features/auth/data/model/user.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/login_params.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/register_params.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';
import 'package:hotel_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:retrofit/retrofit.dart';

class AuthRepoImplementation implements AuthRepository {
  final AuthApiService _authApiService;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '91302144502-iq33d2850ks65a83ja98dj52998umcpa.apps.googleusercontent.com',
  );
  final AuthLocalDataSource local;

  AuthRepoImplementation(this._authApiService, this.local);

  @override
  Future<DataState<UserEntity>> login(LoginParams data) async {
    try {
      final HttpResponse httpResponse = await _authApiService.login(
        data: LoginModel(email: data.email, password: data.password),
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> userData = httpResponse.data['data']['user'];
        final user = UserModel.fromJson(userData);

        await local.saveToken(httpResponse.data['data']['refresh'], 'refresh');
        await local.saveToken(httpResponse.data['data']['access'], 'access');
        return DataSuccess(user);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserEntity>> googleLogin() async {
    try {
      print('Starting Google Sign-In process');
      await _googleSignIn.signOut(); // Ensure previous sessions are cleared
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: 'Google Sign-In'),
            error: 'Google Sign-In was cancelled by the user.',
            type: DioExceptionType.cancel,
          ),
        );
      }
      final googleAuth = await googleUser.authentication;
      print("ID TOKEN: ${googleAuth.idToken}");
      print("ACCESS TOKEN: ${googleAuth.accessToken}");
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: 'Google Sign-In'),
            error: 'Failed to retrieve Google ID token.',
            type: DioExceptionType.unknown,
          ),
        );
      }

      final HttpResponse httpResponse = await _authApiService.googleLogin(
        body: {'id_token': idToken},
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> userData = httpResponse.data['data'];
        final user = UserModel.fromJson(userData);
        return DataSuccess(user);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      print(' Google Sign-In error: $e');
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserEntity>> register(RegisterParams data) async {
    try {
      final HttpResponse httpResponse = await _authApiService.register(
        data: RegisterModel(
          firstName: data.firstName,
          lastName: data.lastName,
          email: data.email,
          password: data.password,
          confirmPassword: data.confirmPassword,
        ),
      );

      if (httpResponse.response.statusCode == HttpStatus.created) {
        final Map<String, dynamic> userData = httpResponse.data['data'];
        final user = UserModel.fromJson(userData);
        return DataSuccess(user);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
}
