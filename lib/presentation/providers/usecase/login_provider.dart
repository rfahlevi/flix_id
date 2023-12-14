import 'package:flix_id/domain/usecases/login/login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth-repository/auth_repository_provider.dart';
import '../repositories/user-repository/user_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
      authRepository: ref.watch(authRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
