enum MovieListCategories { nowPlaying, upcoming, popular, search }

class GetMovieListParam {
  final int page;
  final String query;
  final MovieListCategories category;

  GetMovieListParam({this.page = 1, required this.category, this.query = ''});
}
