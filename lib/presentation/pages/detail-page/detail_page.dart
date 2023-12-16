// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/providers/movie/movie_detail_provider.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';

import 'package:flix_id/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'methods/background.dart';
import 'methods/cast_and_crew.dart';
import 'methods/movie_overview.dart';
import 'methods/movie_short_info.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncMovieDetail = ref.watch(MovieDetailProvider(movie: movie));
    return Scaffold(
      body: Stack(
        children: [
          ...background(movie),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackNavigationBar(
                      title: movie.title,
                      onTap: () => ref.watch(routerProvider).pop(),
                    ),
                    verticalSpace(24),
                    NetworkImageCard(
                      width: MediaQuery.of(context).size.width - 40,
                      height: (MediaQuery.of(context).size.width - 40) * 0.6,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${asyncMovieDetail.value?.backdropPath ?? movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                    verticalSpace(24),
                    ...movieShortInfo(
                      asyncMovieDetail: asyncMovieDetail,
                      context: context,
                    ),
                    verticalSpace(24),
                    ...movieOverview(asyncMovieDetail: asyncMovieDetail),
                    verticalSpace(24),
                    ...castAndCrew(
                      title: 'Cast and Crew',
                      movie: movie,
                      ref: ref,
                    ),
                    verticalSpace(40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: saffron,
                            foregroundColor: backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          MovieDetail? movieDetail = asyncMovieDetail.valueOrNull;

                          if (movieDetail != null) {
                            ref.read(routerProvider).pushNamed('time-booking', extra: movieDetail);
                          }
                        },
                        child: const Text('Book this movie'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
