// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flutter/material.dart';

import 'package:flix_id/domain/entities/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: transaction.title != 'Top Up'
                        ? NetworkImage(
                                'https://image.tmdb.org/t/p/w500${transaction.transactionImage}')
                            as ImageProvider
                        : const AssetImage('assets/topup.png'),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEEE, d MMMM y').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          transaction.watchingTime ?? DateTime.now().millisecondsSinceEpoch),
                    ),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  verticalSpace(5),
                  Text(
                    transaction.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    transaction.title == 'Top Up'
                        ? '+ ${(-transaction.total).toIDRCurrencyFormat()}'
                        : transaction.total.toIDRCurrencyFormat(),
                    style: TextStyle(
                      color: transaction.title == 'Top Up'
                          ? const Color.fromARGB(255, 107, 237, 90)
                          : const Color(0XFFEAA94E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
