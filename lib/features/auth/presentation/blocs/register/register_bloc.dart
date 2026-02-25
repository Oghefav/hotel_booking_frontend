import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/register_params.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/register.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_event.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;
  RegisterBloc(this._registerUsecase) : super(const RegisterInitial()) {
    on<RegisterEvent>(onRegister);
  }

  void onRegister(
    RegisterEvent registerEvent,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterLoading());
    final params = RegisterParams(
      firstName: registerEvent.firstName,
      lastName: registerEvent.lastName,
      email: registerEvent.email,
      password: registerEvent.password,
      confirmPassword: registerEvent.confirmPassword,
    );
    final dataState = await _registerUsecase(params: params);

    if (dataState is DataFailed) {
      final dioError = dataState.error;
      String serverMessage = "An unexpected error occurred.";
      if (dioError != null && dioError.response?.data['detail'] != null) {
        serverMessage = dioError.response?.data['detail'];
      } else {
        serverMessage = dioError?.message ?? serverMessage;
      }
      print(serverMessage);
      emit(RegisterError(serverMessage));
    }
    if (dataState is DataSuccess && dataState.data.isBlank == false) {
      emit(RegisterSuccess(dataState.data!));
    }
  }
}
