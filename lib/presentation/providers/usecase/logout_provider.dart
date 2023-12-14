import 'package:flix_id/domain/usecases/logout/logout.dart';
import 'package:flix_id/presentation/providers/repositories/auth-repository/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) => Logout(authRepository: ref.watch(authRepositoryProvider));
