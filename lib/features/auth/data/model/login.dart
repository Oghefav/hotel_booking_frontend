import 'package:hotel_booking_app/features/auth/domain/entities/login_params.dart';

class LoginModel extends LoginParams {
  const LoginModel({required super.email,required super.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
