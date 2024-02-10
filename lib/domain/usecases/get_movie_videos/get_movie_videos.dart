import 'package:xsis_movie/domain/entities/movie_video.dart';

import '../../../data/repositories/movie_repository.dart';
import '../../entities/result.dart';
import '../usecase.dart';

class GetMovieVideos implements UseCase<Result<List<MovieVideo>>, int> {
  final MovieRepository _movieRepository;

  GetMovieVideos({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<MovieVideo>>> call(int id) async {
    var movieResult = await _movieRepository.getMovieVideos(id: id);

    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message)
    };
  }
}
