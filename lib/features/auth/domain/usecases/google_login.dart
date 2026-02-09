import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/core/usecase/usecase.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';
import 'package:hotel_booking_app/features/auth/domain/repository/auth_repository.dart';

class GoogleLoginUsecase implements UseCase<DataState<UserEntity>, void> {
  final AuthRepository _authRepository;

  GoogleLoginUsecase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({void params}) {
    return _authRepository.googleLogin();
  }
}