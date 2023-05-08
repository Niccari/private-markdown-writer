// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Memo {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastModifiedAt => throw _privateConstructorUsedError;
  DateTime get lastOpenedAt => throw _privateConstructorUsedError;
  DateTime? get willDeleteAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime lastModifiedAt,
      DateTime lastOpenedAt,
      DateTime? willDeleteAt,
      String title,
      String content});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? lastModifiedAt = null,
    Object? lastOpenedAt = null,
    Object? willDeleteAt = freezed,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastOpenedAt: null == lastOpenedAt
          ? _value.lastOpenedAt
          : lastOpenedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      willDeleteAt: freezed == willDeleteAt
          ? _value.willDeleteAt
          : willDeleteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemoCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$_MemoCopyWith(_$_Memo value, $Res Function(_$_Memo) then) =
      __$$_MemoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime lastModifiedAt,
      DateTime lastOpenedAt,
      DateTime? willDeleteAt,
      String title,
      String content});
}

/// @nodoc
class __$$_MemoCopyWithImpl<$Res> extends _$MemoCopyWithImpl<$Res, _$_Memo>
    implements _$$_MemoCopyWith<$Res> {
  __$$_MemoCopyWithImpl(_$_Memo _value, $Res Function(_$_Memo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? lastModifiedAt = null,
    Object? lastOpenedAt = null,
    Object? willDeleteAt = freezed,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$_Memo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastOpenedAt: null == lastOpenedAt
          ? _value.lastOpenedAt
          : lastOpenedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      willDeleteAt: freezed == willDeleteAt
          ? _value.willDeleteAt
          : willDeleteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Memo implements _Memo {
  const _$_Memo(
      {required this.id,
      required this.createdAt,
      required this.lastModifiedAt,
      required this.lastOpenedAt,
      required this.willDeleteAt,
      required this.title,
      required this.content});

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastModifiedAt;
  @override
  final DateTime lastOpenedAt;
  @override
  final DateTime? willDeleteAt;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'Memo(id: $id, createdAt: $createdAt, lastModifiedAt: $lastModifiedAt, lastOpenedAt: $lastOpenedAt, willDeleteAt: $willDeleteAt, title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Memo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt) &&
            (identical(other.lastOpenedAt, lastOpenedAt) ||
                other.lastOpenedAt == lastOpenedAt) &&
            (identical(other.willDeleteAt, willDeleteAt) ||
                other.willDeleteAt == willDeleteAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, lastModifiedAt,
      lastOpenedAt, willDeleteAt, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemoCopyWith<_$_Memo> get copyWith =>
      __$$_MemoCopyWithImpl<_$_Memo>(this, _$identity);
}

abstract class _Memo implements Memo {
  const factory _Memo(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime lastModifiedAt,
      required final DateTime lastOpenedAt,
      required final DateTime? willDeleteAt,
      required final String title,
      required final String content}) = _$_Memo;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastModifiedAt;
  @override
  DateTime get lastOpenedAt;
  @override
  DateTime? get willDeleteAt;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_MemoCopyWith<_$_Memo> get copyWith => throw _privateConstructorUsedError;
}
