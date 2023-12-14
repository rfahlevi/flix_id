import 'package:flix_id/domain/usecases/get_user_balance/get_user_balance.dart';
import 'package:flix_id/presentation/providers/repositories/user-repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_balance.g.dart';

@riverpod
GetUserBalance getUserBalance(GetUserBalanceRef ref) =>
    GetUserBalance(userRepository: ref.watch(userRepositoryProvider));
