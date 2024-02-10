// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Movie({
    required int id,
    required String title,
    String? posterPath,
    required String releaseDate,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
