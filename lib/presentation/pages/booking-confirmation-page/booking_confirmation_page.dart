// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/pages/booking-confirmation-page/methods/transaction_row.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/transaction.dart';

class BookingConfirmationPage extends ConsumerWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const BookingConfirmationPage({
    super.key,
    required this.transactionDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var (movieDetail, transactionResult) = transactionDetail;

    transactionResult = transactionResult.copyWith(
      total: transactionResult.ticketPrice! * transactionResult.ticketAmount! +
          transactionResult.adminFee,
    );

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackNavigationBar(
                  title: 'Booking Confirmation',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(20),
                NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 40,
                  height: (MediaQuery.of(context).size.width - 40) * 0.6,
                  borderRadius: 15,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}',
                  fit: BoxFit.cover,
                ),
                verticalSpace(20),
                Text(
                  movieDetail.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(10),
                const Divider(color: ghostWhite),
                transactionRow(
                    title: 'Showing Date',
                    value: DateFormat('EEEE, d MMMM y').format(
                        DateTime.fromMillisecondsSinceEpoch(transactionResult.watchingTime ?? 0)),
                    width: MediaQuery.of(context).size.width - 40),
                transactionRow(
                    title: 'Theater',
                    value: transactionResult.theaterName ?? '',
                    width: MediaQuery.of(context).size.width - 40),
                transactionRow(
                    title: 'Seats Number',
                    value: transactionResult.seats.join(', '),
                    width: MediaQuery.of(context).size.width - 40),
                transactionRow(
                    title: '# of Tickets',
                    value: '${transactionResult.ticketAmount} ticket(s)',
                    width: MediaQuery.of(context).size.width - 40),
                transactionRow(
                    title: 'Ticket Price',
                    value: '${transactionResult.ticketPrice?.toIDRCurrencyFormat()}',
                    width: MediaQuery.of(context).size.width - 40),
                transactionRow(
                    title: 'Adm Free',
                    value: transactionResult.adminFee.toIDRCurrencyFormat(),
                    width: MediaQuery.of(context).size.width - 40),
                const Divider(color: ghostWhite),
                transactionRow(
                    title: 'Total Price',
                    value: transactionResult.total.toIDRCurrencyFormat(),
                    width: MediaQuery.of(context).size.width - 40),
                verticalSpace(40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      int transactionTime = DateTime.now().millisecondsSinceEpoch;
                      transactionResult = transactionResult.copyWith(
                        transactionTime: transactionTime,
                        id: 'FLX-$transactionTime-${transactionResult.uid}',
                      );

                      ref
                          .read(transactionDataProvider.notifier)
                          .createTransaction(transaction: transactionResult)
                          .whenComplete(() {
                        ref.watch(transactionDataProvider).when(
                              data: (data) {
                                context.showSnackbar('Success Create Transaction');
                                ref.read(transactionDataProvider.notifier).refreshTransactionData();
                                ref.read(userDataProvider.notifier).refreshUserData();
                                ref.read(routerProvider).goNamed('main');
                              },
                              error: (error, stackTrace) {
                                context.showSnackbar(error.toString());
                              },
                              loading: () {},
                            );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: saffron,
                      foregroundColor: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: ref.watch(transactionDataProvider).when(
                          data: (data) => const Text('Pay Now'),
                          error: (error, stackTrace) => const Text('Pay Now'),
                          loading: () => const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              color: backgroundColor,
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
