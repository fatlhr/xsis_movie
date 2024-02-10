import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_video.freezed.dart';
part 'movie_video.g.dart';

@freezed
class MovieVideo with _$MovieVideo {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieVideo({
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    DateTime? publishedAt,
    String? id,
  }) = _MovieVideo;

  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoFromJson(json);
}
