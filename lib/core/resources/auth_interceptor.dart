import 'package:dio/dio.dart';
import 'package:hotel_booking_app/features/auth/data/data%20source/local/auth_local_datastore.dart';


class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource localDataSource;
  final Dio refreshDio;
  AuthInterceptor(this.localDataSource, this.refreshDio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await localDataSource.getToken('access');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler)async{ 
    if(err.response?.statusCode == 401){
      final refreshToken = await localDataSource.getToken('refresh');
      if (refreshToken != null){
        try{
          final response = await refreshDio.post('/refresh_token/', data: {'refresh_token' : refreshToken});
          if (response.statusCode == 200){
            final newAccessToken = response.data['access'];
            await localDataSource.saveToken(newAccessToken, 'access');

            err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

            final clonedRequest = await refreshDio.request(err.requestOptions.path,
            options: Options(method: err.requestOptions.method, headers: err.requestOptions.headers),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters
            );
            return handler.resolve(clonedRequest);
          }
        } catch (e){
          await localDataSource.clear('access',);
          await localDataSource.clear('refresh');
        }
      }
    }
    return handler.next(err);
  }

}