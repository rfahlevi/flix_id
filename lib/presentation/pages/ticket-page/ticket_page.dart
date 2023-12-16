import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:flix_id/presentation/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketPage extends ConsumerWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Your Tickets Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              verticalSpace(40),
              ...ref.watch(transactionDataProvider).when(
                    data: (transactions) => transactions!.isEmpty
                        ? [
                            verticalSpace(260),
                            const Center(
                              child: Text(
                                'There are no tickets \nyou have ordered yet',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]
                        : (transactions
                                .where((element) =>
                                    element.title != 'Top Up' &&
                                    element.watchingTime! >= DateTime.now().millisecondsSinceEpoch)
                                .toList()
                              ..sort((a, b) => a.watchingTime!.compareTo(b.watchingTime!)))
                            .map((transaction) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Ticket(transaction: transaction),
                                ))
                            .toList(),
                    error: (error, stackTrace) => [],
                    loading: () => [
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
