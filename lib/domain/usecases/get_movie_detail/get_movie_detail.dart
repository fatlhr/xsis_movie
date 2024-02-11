import '../../../data/repositories/movie_repository.dart';
import '../../entities/movie_detail.dart';
import '../../entities/result.dart';
import '../usecase.dart';

class GetMovieDetail implements UseCase<Result<MovieDetail>, int> {
  final MovieRepository _movieRepository;

  GetMovieDetail({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> call(int id) async {
    var movieDetailResult = await _movieRepository.getDetail(id: id);

    return switch (movieDetailResult) {
      Success(value: final movieDetail) => Result.success(movieDetail),
      Failed(:final message) => Result.failed(message)
    };
  }
}
