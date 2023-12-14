import 'package:flix_id/data/repositories/auth_repository.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetLoggedInUser implements Usecase<Result<User>, void> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  GetLoggedInUser({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    String? loggedId = _authRepository.getLoggedInUserId();

    if (loggedId != null) {
      var userResult = await _userRepository.getUser(uid: loggedId);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed('No user logged in');
    }
  }
}
