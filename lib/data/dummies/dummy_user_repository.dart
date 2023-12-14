import 'dart:io';

import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(User(uid: uid, name: 'Dummy', email: 'dummy@dummy.com'));
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalance({required String uid, required int balance}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture({required User user, required File imageFile}) {
    throw UnimplementedError();
  }
}
