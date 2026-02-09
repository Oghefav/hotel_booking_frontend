import 'package:equatable/equatable.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';

abstract class LoginState extends Equatable {
  final UserEntity? user;
  final String? error;
  const LoginState({this.user, this.error});

  @override
  List<Object?> get props => [user, error];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginError extends LoginState {
  final String serverMessage;
  const LoginError(this.serverMessage) : super(error: serverMessage);
}

class LoginSuccess extends LoginState {
  const LoginSuccess(UserEntity user) : super(user: user);
}
