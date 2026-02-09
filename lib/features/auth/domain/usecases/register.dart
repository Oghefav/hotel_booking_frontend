import 'package:hotel_booking_app/core/resources/data_state.dart';
import 'package:hotel_booking_app/core/usecase/usecase.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/register_params.dart';
import 'package:hotel_booking_app/features/auth/domain/entities/user.dart';
import 'package:hotel_booking_app/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements UseCase<DataState<UserEntity>, RegisterParams>{
  final AuthRepository _authRepository;

  RegisterUsecase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({RegisterParams? params}) {
    return _authRepository.register(params!);
  }
}