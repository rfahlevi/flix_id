import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieShortInfo({
  required AsyncValue<MovieDetail?> asyncMovieDetail,
  required BuildContext context,
}) =>
    [
      Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Image.asset('assets/duration.png'),
          ),
          horizontalSpaces(5),
          SizedBox(
            width: 95,
            child: Text('${asyncMovieDetail.when(
              data: (movieDetail) => movieDetail?.runtime ?? '-',
              error: (error, stackTrace) => '-',
              loading: () => '-',
            )} Minutes'),
          ),
          horizontalSpaces(5),
          SizedBox(
            width: 18,
            height: 18,
            child: Image.asset('assets/genre.png'),
          ),
          horizontalSpaces(5),
          Expanded(
            child: Text(
              asyncMovieDetail.when(
                data: (data) {
                  String? genres = data?.genres.join(', ') ?? '-';

                  return genres;
                },
                error: (error, stackTrace) => '-',
                loading: () => '-',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      verticalSpace(10),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Image.asset('assets/star.png'),
          ),
          horizontalSpaces(5),
          Text(asyncMovieDetail.valueOrNull?.voteAverage.toStringAsFixed(1) ?? '0')
        ],
      ),
    ];
