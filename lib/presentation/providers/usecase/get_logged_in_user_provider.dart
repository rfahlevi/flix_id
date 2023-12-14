import 'package:flix_id/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:flix_id/presentation/providers/repositories/auth-repository/auth_repository_provider.dart';
import 'package:flix_id/presentation/providers/repositories/user-repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) => GetLoggedInUser(
      authRepository: ref.watch(authRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
