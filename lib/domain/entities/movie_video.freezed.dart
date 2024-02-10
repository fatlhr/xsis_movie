// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) {
  return _MovieVideo.fromJson(json);
}

/// @nodoc
mixin _$MovieVideo {
  String? get name => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get site => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get official => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieVideoCopyWith<MovieVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieVideoCopyWith<$Res> {
  factory $MovieVideoCopyWith(
          MovieVideo value, $Res Function(MovieVideo) then) =
      _$MovieVideoCopyWithImpl<$Res, MovieVideo>;
  @useResult
  $Res call(
      {String? name,
      String? key,
      String? site,
      int? size,
      String? type,
      bool? official,
      DateTime? publishedAt,
      String? id});
}

/// @nodoc
class _$MovieVideoCopyWithImpl<$Res, $Val extends MovieVideo>
    implements $MovieVideoCopyWith<$Res> {
  _$MovieVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? key = freezed,
    Object? site = freezed,
    Object? size = freezed,
    Object? type = freezed,
    Object? official = freezed,
    Object? publishedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieVideoImplCopyWith<$Res>
    implements $MovieVideoCopyWith<$Res> {
  factory _$$MovieVideoImplCopyWith(
          _$MovieVideoImpl value, $Res Function(_$MovieVideoImpl) then) =
      __$$MovieVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? key,
      String? site,
      int? size,
      String? type,
      bool? official,
      DateTime? publishedAt,
      String? id});
}

/// @nodoc
class __$$MovieVideoImplCopyWithImpl<$Res>
    extends _$MovieVideoCopyWithImpl<$Res, _$MovieVideoImpl>
    implements _$$MovieVideoImplCopyWith<$Res> {
  __$$MovieVideoImplCopyWithImpl(
      _$MovieVideoImpl _value, $Res Function(_$MovieVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? key = freezed,
    Object? site = freezed,
    Object? size = freezed,
    Object? type = freezed,
    Object? official = freezed,
    Object? publishedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$MovieVideoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MovieVideoImpl implements _MovieVideo {
  const _$MovieVideoImpl(
      {this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  factory _$MovieVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieVideoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? key;
  @override
  final String? site;
  @override
  final int? size;
  @override
  final String? type;
  @override
  final bool? official;
  @override
  final DateTime? publishedAt;
  @override
  final String? id;

  @override
  String toString() {
    return 'MovieVideo(name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieVideoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.official, official) ||
                other.official == official) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, key, site, size, type, official, publishedAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieVideoImplCopyWith<_$MovieVideoImpl> get copyWith =>
      __$$MovieVideoImplCopyWithImpl<_$MovieVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieVideoImplToJson(
      this,
    );
  }
}

abstract class _MovieVideo implements MovieVideo {
  const factory _MovieVideo(
      {final String? name,
      final String? key,
      final String? site,
      final int? size,
      final String? type,
      final bool? official,
      final DateTime? publishedAt,
      final String? id}) = _$MovieVideoImpl;

  factory _MovieVideo.fromJson(Map<String, dynamic> json) =
      _$MovieVideoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get key;
  @override
  String? get site;
  @override
  int? get size;
  @override
  String? get type;
  @override
  bool? get official;
  @override
  DateTime? get publishedAt;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$MovieVideoImplCopyWith<_$MovieVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
