import 'package:get/get.dart';
import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/login_params.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/login.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_event.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;
  LoginBloc(this._loginUsecase) : super(const LoginInitial()) {
    on<LoginEvent>(onLogin);
  }

  void onLogin(LoginEvent loginEvent, Emitter<LoginState> emit) async {
    final params = LoginParams(
      email: loginEvent.email,
      password: loginEvent.password,
    );
    emit(const LoginLoading());
    final dataState = await _loginUsecase(params: params);

    if (dataState is DataFailed) {
      final dioError = dataState.error;
      String serverMessage = "An unexpected error occurred.";
      if (dioError != null && dioError.response?.data['detail'] !=null){
        serverMessage = dioError.response?.data['detail'];
      }else{
        serverMessage = dioError?.message ?? serverMessage;
      }
      emit(LoginError(serverMessage));
    }
    if (dataState is DataSuccess && dataState.data!.isBlank == false) {
      {
        emit(LoginSuccess(dataState.data!));
      }
    }
  }
}
