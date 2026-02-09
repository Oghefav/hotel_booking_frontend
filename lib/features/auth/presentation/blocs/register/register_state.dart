import 'package:equatable/equatable.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';

abstract class RegisterState  extends Equatable{
  final UserEntity? user;
  final String? error;
  const RegisterState({this.user, this.error});

  @override
  List<Object?> get props => [user, error];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterError extends RegisterState {
  final String serverMessage;
  const RegisterError(this.serverMessage) : super(error: serverMessage);
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(UserEntity user) : super(user: user);
}