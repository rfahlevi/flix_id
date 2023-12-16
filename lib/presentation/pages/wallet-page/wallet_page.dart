import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/pages/wallet-page/methods/recent_transactions.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/pages/wallet-page/methods/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackNavigationBar(
                  title: 'My Wallet',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(20),
                walletCard(ref),
                verticalSpace(20),
                ...recentTransactions(ref),
                verticalSpace(20),
                // recent transaction
              ],
            ),
          ),
        ],
      ),
    );
  }
}
