import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> userInfo(WidgetRef ref) => [
      Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1),
          image: DecorationImage(
            image: ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                ? NetworkImage(ref.watch(userDataProvider).valueOrNull!.photoUrl!) as ImageProvider
                : const AssetImage('assets/pp-placeholder.png'),
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          ref.watch(userDataProvider).valueOrNull?.name ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          ref.watch(userDataProvider).valueOrNull?.email ?? '',
        ),
      ),
      verticalSpace(24),
    ];
