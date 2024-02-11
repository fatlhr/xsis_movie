import 'package:dio/dio.dart';
import 'package:xsis_movie/domain/entities/movie_video.dart';
import 'package:xsis_movie/presentation/const/const.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/result.dart';
import '../repositories/movie_repository.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjhjZWIwNjc4N2Q3YTBhN2E3YWE2Yjg0OTk1YzU3OSIsInN1YiI6IjY1YWNlYzM2MDljMjRjMDBjYWFlMGY2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mEdIO1MHcYbjVFZmmhrmRmZLB_rlohk8V-S038VJEzE';

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json',
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
        '$baseURL/movie/$id?language=en-US',
        options: _options,
      );

      print('response detail: $response');

      return Result.success(MovieDetail.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
      _getMovies(_MovieCategory.nowPlaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) async =>
      _getMovies(_MovieCategory.upcoming.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getPopular({int page = 1}) async =>
      _getMovies(_MovieCategory.popular.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category,
      {int page = 1}) async {
    try {
      final response = await _dio!.get(
          '$baseURL/movie/$category?language=en-US&page=$page',
          options: _options);

      final results = List<Map<String, dynamic>>.from(response.data['results']);
      // print('object results: $results');
      return Result.success(results.map((e) => Movie.fromJson(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<MovieVideo>>> getMovieVideos({required int id}) async {
    try {
      final response = await _dio!.get(
        '$baseURL/movie/$id/videos?language=en-US',
        
        options: _options,
      );
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      return Result.success(
        results.map((e) => MovieVideo.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming'),
  popular('popular');

  final String _instring;

  const _MovieCategory(String inString) : _instring = inString;

  @override
  String toString() => _instring;
}
