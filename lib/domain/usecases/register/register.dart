import 'package:flix_id/data/repositories/auth_repository.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/register/register_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class Register implements Usecase<Result<User>, RegisterParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  Register({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    var uidResult = await _authRepository.register(
      email: params.email,
      password: params.password,
    );

    if (uidResult.isSuccess) {
      var userResult = await _userRepository.createUser(
        uid: uidResult.resultValue!,
        email: params.email,
        name: params.name,
        photoUrl: params.photoUrl,
      );

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Result.failed(uidResult.errorMessage!);
    }
  }
}
