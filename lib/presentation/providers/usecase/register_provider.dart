import 'package:flix_id/domain/usecases/register/register.dart';
import 'package:flix_id/presentation/providers/repositories/auth-repository/auth_repository_provider.dart';
import 'package:flix_id/presentation/providers/repositories/user-repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) => Register(
    authRepository: ref.watch(authRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider));
