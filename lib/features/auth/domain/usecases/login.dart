import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/core/usecase/usecase.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/login_params.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';
import 'package:hotel_booking_app/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase implements UseCase<DataState<UserEntity>, LoginParams> {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({LoginParams? params}) {
    return _authRepository.login(params!);
  }
}



