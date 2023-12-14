import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_user_balance/get_user_balance_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetUserBalance implements Usecase<Result<int>, GetUserBalanceParams> {
  final UserRepository _userRepository;

  GetUserBalance({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<Result<int>> call(GetUserBalanceParams params) async {
    var userBalanceResult = await _userRepository.getUserBalance(uid: params.uid);

    return switch (userBalanceResult) {
      Success(value: final userBalance) => Result.success(userBalance),
      Failed(:final message) => Result.failed(message)
    };
  }
}
