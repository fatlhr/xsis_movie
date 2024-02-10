import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecases/get_movie_videos/get_movie_videos.dart';
import '../repositories/movie_repository/movie_repository_provider.dart';

part 'get_movie_videos_provider.g.dart';

@riverpod
GetMovieVideos getMovieVideos(GetMovieVideosRef ref) => GetMovieVideos(
      movieRepository: ref.watch(movieRepositoryProvider),
    );
