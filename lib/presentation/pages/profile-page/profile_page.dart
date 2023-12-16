import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/pages/profile-page/methods/profile_item.dart';
import 'package:flix_id/presentation/pages/profile-page/methods/user_info.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      child: ListView(
        children: [
          ...userInfo(ref),
          const Divider(),
          verticalSpace(14),
          profileItem(
            title: 'Update Profile',
            onTap: () {},
          ),
          profileItem(
            title: 'My Wallet',
            onTap: () => ref.read(routerProvider).pushNamed('wallet'),
          ),
          profileItem(
            title: 'Change Password',
            onTap: () {},
          ),
          profileItem(
            title: 'Change Language',
            onTap: () {},
          ),
          const Divider(),
          verticalSpace(14),
          profileItem(
            title: 'Contact Us',
            onTap: () {},
          ),
          profileItem(
            title: 'Privacy Policy',
            onTap: () {},
          ),
          profileItem(
            title: 'Terms and Condition',
            onTap: () {},
          ),
          verticalSpace(40),
          ElevatedButton(
            onPressed: () => ref.read(userDataProvider.notifier).logout(),
            child: ref.watch(userDataProvider).whenOrNull(
                  data: (data) => const Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  loading: () => const Center(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
          ),
          verticalSpace(40),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Version 0.0.1',
              style: TextStyle(fontSize: 12),
            ),
          ),
          verticalSpace(100),
        ],
      ),
    );
  }
}
