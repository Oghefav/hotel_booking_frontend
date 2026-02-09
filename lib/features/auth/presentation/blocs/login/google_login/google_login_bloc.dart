import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/features/auth/domain/usecases/google_login.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_event.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_state.dart';

class GoogleLoginBloc extends Bloc<GoogleLogInEvent, GoogleLoginState> {
  final GoogleLoginUsecase _googleLoginUsecase;
  GoogleLoginBloc(this._googleLoginUsecase)
    : super(const GoogleLoginInitial()) {
    on<GoogleLogInEvent>(onGoogleLogin);
  }

  void onGoogleLogin(
    GoogleLogInEvent googleLogInEvent,
    Emitter<GoogleLoginState> emit,
  ) async {
    emit(const GoogleLoginLoading());
    final dataState = await _googleLoginUsecase();

    if (dataState is DataFailed) {
      final dioError = dataState.error;
      String serverMessage = "An unexpected error occurred.";
      if (dioError !=null && dioError.response?.data['message'] !=null){
        serverMessage = dioError.response?.data['message'];
    }
      emit(GoogleLoginError(serverMessage));
    }
    if(dataState is DataSuccess){
      emit(GoogleLoginSuccess(dataState.data!));
    }
  }
}
