import 'package:equatable/equatable.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';

abstract class GoogleLoginState  extends Equatable{
  final String? error;
  final UserEntity? user;
  const GoogleLoginState({this.error, this.user});

  @override
  List<Object?> get props => [error, user];
}

class GoogleLoginInitial extends GoogleLoginState {
  const GoogleLoginInitial();
}

class GoogleLoginLoading extends GoogleLoginState {
  const GoogleLoginLoading();
}

class GoogleLoginError extends GoogleLoginState {
  final String serverMessage;
  const GoogleLoginError(this.serverMessage) : super(error: serverMessage);
}

class GoogleLoginSuccess extends GoogleLoginState {
  const GoogleLoginSuccess(UserEntity user) : super(user: user);
}