enum MovieListCategories { nowPlaying, upcoming }

class GetMovieListParams {
  final int page;
  final MovieListCategories categories;

  GetMovieListParams({this.page = 1, required this.categories});
}
