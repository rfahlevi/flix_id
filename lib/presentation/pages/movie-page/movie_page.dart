import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/pages/movie-page/methods/movie_list.dart';
import 'package:flix_id/presentation/pages/movie-page/methods/promotion_list.dart';
import 'package:flix_id/presentation/pages/movie-page/methods/search_bar.dart';
import 'package:flix_id/presentation/providers/movie/now_playing_provider.dart';
import 'package:flix_id/presentation/providers/movie/upcoming_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'methods/user_info.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = const [
    'assets/popcorn.jpg',
    'assets/buy1get1.jpg',
  ];
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userInfo(ref),
              verticalSpace(24),
              searchBar(context),
              verticalSpace(24),
              ...movieList(
                title: 'Now Playing',
                movies: ref.watch(nowPlayingProvider),
                onTap: (movie) {
                  // Move to Detail Page
                },
              ),
              verticalSpace(24),
              ...promotionList(promotionImageFileNames),
              verticalSpace(24),
              ...movieList(
                title: 'Upcoming',
                movies: ref.watch(upcomingProvider),
                onTap: (movie) {
                  // Move to Detail Page
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
