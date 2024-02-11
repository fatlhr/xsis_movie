import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecases/get_movie_list/get_movie_list.dart';
import '../../../domain/usecases/get_movie_list/get_movie_list_param.dart';
import '../usecases/get_movie_list_provider.dart';

part 'movie_search_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieSearch extends _$MovieSearch {
  @override
  FutureOr<List<Movie>> build() => [];

  Future<List<Movie>> getMovies({int page = 1, required String query}) async {
    state = const AsyncLoading();

    GetMovieList getMovieList = ref.read(getMovieListProvider);

    var result = await getMovieList(
      GetMovieListParam(
        category: MovieListCategories.search,
        page: page,
        query: query,
      ),
    );

    switch (result) {
      case Success(value: final movies):
        state = AsyncData(movies);
      case Failed(message: _):
        state = const AsyncData([]);
    }
    return state.value ?? [];
  }
}
