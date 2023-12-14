import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

List<Widget> background(Movie movie) => [
      FadeInImage(
        placeholder: const AssetImage('assets/flix_logo.png'),
        image: NetworkImage(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        ),
        width: double.infinity,
        height: double.infinity,
        placeholderFit: BoxFit.scaleDown,
        fit: BoxFit.cover,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor.withOpacity(1),
              backgroundColor.withOpacity(0.7),
            ],
            begin: const Alignment(0, 0.3),
            end: Alignment.topCenter,
          ),
        ),
      ),
    ];
