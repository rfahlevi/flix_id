import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/methods.dart';
import 'package:flutter/material.dart';

List<Widget> detailMovieInfo({
  required MovieDetail movieDetail,
  required BuildContext context,
}) =>
    [
      Text(
        movieDetail.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      verticalSpace(10),
      Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Image.asset(
              'assets/duration.png',
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpaces(10),
          Text('${movieDetail.runtime} Minutes'),
        ],
      ),
      verticalSpace(10),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Image.asset(
              'assets/genre.png',
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpaces(10),
          Expanded(
            child: Text(
              movieDetail.genres.join(', '),
              maxLines: 2,
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
            child: Image.asset(
              'assets/star.png',
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpaces(10),
          Expanded(
            child: Text(
              movieDetail.voteAverage.toStringAsFixed(1),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ];
