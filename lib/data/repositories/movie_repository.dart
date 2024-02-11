import 'package:xsis_movie/domain/entities/movie_video.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<List<Movie>>> getPopular({int page = 1});
  Future<Result<List<Movie>>> getUpcoming({int page = 1});
  Future<Result<List<Movie>>> getSearch(String query, {int page = 1});
  Future<Result<MovieDetail>> getDetail({required int id});
  Future<Result<List<MovieVideo>>> getMovieVideos({required int id});
}
