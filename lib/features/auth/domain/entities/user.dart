import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;

  const UserEntity({
    this.email,
    this.firstName,
    this.id,
    this.lastName,
  });

  @override
  List<Object?> get props {
    return [id, email];
  }
}
