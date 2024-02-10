import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecases/get_movie_list/get_movie_list.dart';
import '../../../domain/usecases/get_movie_list/get_movie_list_param.dart';
import '../usecases/get_movie_list_provider.dart';

part 'latest_provider.g.dart';

@Riverpod(keepAlive: true)
class Latest extends _$Latest {
  @override
  FutureOr<List<Movie>> build() => getMovies();

  Future<List<Movie>> getMovies({int page = 1}) async {
    state = const AsyncLoading();

    GetMovieList getMovieList = ref.read(getMovieListProvider);

    var result = await getMovieList(
      GetMovieListParam(category: MovieListCategories.latest, page: page),
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
