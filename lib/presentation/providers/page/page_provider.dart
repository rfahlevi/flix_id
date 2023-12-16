import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageProvider extends StateNotifier<int> {
  PageProvider() : super(0);

  void onPageChanged(int index) => state = index;
}

final pageProvider = StateNotifierProvider.autoDispose<PageProvider, int>(
  (ref) => PageProvider(),
);
