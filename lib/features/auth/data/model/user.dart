import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({super.id, super.email, super.firstName, super.lastName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}
