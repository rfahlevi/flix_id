import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/widgets/loading_circullar_button.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieList({
  required String title,
  void Function(Movie movie)? onTap,
  required AsyncValue<List<Movie>> movies,
}) =>
    [
      Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      ),
      verticalSpace(10),
      SizedBox(
        height: 228,
        child: movies.when(
          data: (data) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data
                  .map((e) => Padding(
                        padding: EdgeInsets.only(right: e == data.last ? 0 : 10),
                        child: NetworkImageCard(
                          imageUrl: 'https://image.tmdb.org/t/p/w500/${e.posterPath}',
                          fit: BoxFit.cover,
                          onTap: () {},
                        ),
                      ))
                  .toList(),
            ),
          ),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const LoadingCircullarButton(),
        ),
      )
    ];
