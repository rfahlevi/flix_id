import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_params.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transactions.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transactions_params.dart';
import 'package:flix_id/presentation/providers/usecase/create_transaction_provider.dart';
import 'package:flix_id/presentation/providers/usecase/get_transactions_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>?> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionsProvider);
      var result = await getTransactions(GetTransactionsParams(uid: user.uid));
      if (result case Success(value: final transactions)) {
        return transactions;
      }
    }

    return [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionsProvider);
      var result = await getTransactions(GetTransactionsParams(uid: user.uid));

      switch (result) {
        case Success(value: final transactions):
          state = AsyncData(transactions);
        case Failed(message: final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
      }
    }
  }

  Future<void> createTransaction({required Transaction transaction}) async {
    state = const AsyncLoading();

    CreateTransaction createTransaction = ref.read(createTransactionProvider);
    var result = await createTransaction(CreateTransactionParams(transaction: transaction));

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
    }
  }
}
