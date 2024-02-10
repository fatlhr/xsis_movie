import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieDetail({
    required int id,
    required String title,
    String? posterPath,
    required String overview,
    String? backdropPath,
    required int runtime,
    required String releaseDate,
    // convert voteAverage int to double
    required double voteAverage,
    required List<String> genres,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson({
        ...json,
        'vote_average': json['vote_average'].toDouble(),
      });
}
