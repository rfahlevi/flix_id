import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class CreateTransaction implements Usecase<Result<void>, CreateTransactionParams> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParams params) async {
    int transactionTime = DateTime.now().microsecondsSinceEpoch;

    var transactionResult = await _transactionRepository.createTransaction(
      transaction: params.transaction.copyWith(
        transactionTime: transactionTime,
        id: (params.transaction.id == null)
            ? 'FLIX-$transactionTime-${params.transaction.uid}'
            : params.transaction.id,
      ),
    );

    return switch (transactionResult) {
      Success(value: _) => const Result.success(null),
      Failed(:final message) => Result.failed(message),
    };
  }
}
