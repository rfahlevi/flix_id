import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget cardContent(WidgetRef ref) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Ballance',
                style: TextStyle(
                  color: ghostWhite.withOpacity(0.8),
                ),
              ),
              Text(
                (ref.watch(userDataProvider).valueOrNull?.balance ?? 0).toIDRCurrencyFormat(),
                style: const TextStyle(
                  color: saffron,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(10),
              Text(
                ref.watch(userDataProvider).value?.name ?? '0',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => ref.read(userDataProvider.notifier).topUp(100000),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: saffron,
                  ),
                ),
              ),
              verticalSpace(5),
              const Text(
                'Top Up',
                style: TextStyle(fontSize: 12, color: ghostWhite),
              )
            ],
          )
        ],
      ),
    );
