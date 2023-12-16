import 'package:flix_id/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/result.dart';
import '../../../domain/entities/transaction.dart';
import '../usecase/create_transaction_provider.dart';

part 'transaction_provider.g.dart';

@riverpod
Future<void> create(CreateRef ref, {required Transaction transaction}) async {
  CreateTransaction create = ref.read(createTransactionProvider);
  var result = await create(CreateTransactionParams(transaction: transaction));

  return switch (result) {
    Success(value: final message) => message,
    Failed(message: _) => 'Failed to create transaction',
  };
}
