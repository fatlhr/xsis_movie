import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xsis_movie/presentation/providers/usecases/get_movie_videos_provider.dart';

import '../../../domain/entities/movie_video.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecases/get_movie_videos/get_movie_videos.dart';

part 'movie_videos_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieVideos extends _$MovieVideos {
  @override
  FutureOr<List<MovieVideo>> build() => [];

  Future<List<MovieVideo>> getVideos({required int id}) async {
    state = const AsyncLoading();

    GetMovieVideos getMovieVideos = ref.read(getMovieVideosProvider);

    var result = await getMovieVideos(id);

    switch (result) {
      case Success(value: final movies):
        state = AsyncData(movies);
      case Failed(message: _):
        state = const AsyncData([]);
    }
    return state.value ?? [];
  }
}
