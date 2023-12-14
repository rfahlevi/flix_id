import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget userInfo(WidgetRef ref) => Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 24, 0),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 1),
              image: DecorationImage(
                image: ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                    ? NetworkImage(ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                        as ImageProvider
                    : const AssetImage('assets/pp-placeholder.png'),
              ),
            ),
          ),
          horizontalSpaces(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${greetings()}, ${ref.watch(userDataProvider).when(
                      data: (user) => user?.name.split(' ').first ?? '',
                      error: (error, stackTrace) => '',
                      loading: () => 'Loading..',
                    )}!',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text("Let's book your favourite movie!"),
              verticalSpace(5),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: Image.asset('assets/wallet.png'),
                  ),
                  horizontalSpaces(10),
                  GestureDetector(
                    onTap: () {
                      // Go To Wallet Page
                    },
                    child: Text(
                      ref.watch(userDataProvider).when(
                            data: (user) => (user?.balance ?? 0).toIDRCurrencyFormat(),
                            error: (error, stackTrace) => 'IDR0',
                            loading: () => 'Loading..',
                          ),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );

String greetings() {
  var hour = DateTime.now().hour;
  switch (hour) {
    case < 12:
      return 'Good Morning';
    case < 18:
      return 'Good Afternoon';
    default:
      return 'Good Evening';
  }
}
