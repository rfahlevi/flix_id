import 'package:flix_id/data/repositories/auth_repository.dart';
import 'package:flix_id/domain/entities/result.dart';

class DummyAuthRepository implements AuthRepository {
  @override
  String? getLoggedInUserId() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    // return const Result.success('ID-12345');
    return const Result.failed('Failed Login!');
  }

  @override
  Future<Result<void>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register({required String email, required String password}) {
    throw UnimplementedError();
  }
}
