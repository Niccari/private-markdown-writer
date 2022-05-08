// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$MemoCopyWithImpl<$Res>;
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
class _$MemoCopyWithImpl<$Res> implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  final Memo _value;
  // ignore: unused_field
  final $Res Function(Memo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? lastModifiedAt = freezed,
    Object? lastOpenedAt = freezed,
    Object? willDeleteAt = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: lastModifiedAt == freezed
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastOpenedAt: lastOpenedAt == freezed
          ? _value.lastOpenedAt
          : lastOpenedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      willDeleteAt: willDeleteAt == freezed
          ? _value.willDeleteAt
          : willDeleteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MemoCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$MemoCopyWith(_Memo value, $Res Function(_Memo) then) =
      __$MemoCopyWithImpl<$Res>;
  @override
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
class __$MemoCopyWithImpl<$Res> extends _$MemoCopyWithImpl<$Res>
    implements _$MemoCopyWith<$Res> {
  __$MemoCopyWithImpl(_Memo _value, $Res Function(_Memo) _then)
      : super(_value, (v) => _then(v as _Memo));

  @override
  _Memo get _value => super._value as _Memo;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? lastModifiedAt = freezed,
    Object? lastOpenedAt = freezed,
    Object? willDeleteAt = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_Memo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: lastModifiedAt == freezed
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastOpenedAt: lastOpenedAt == freezed
          ? _value.lastOpenedAt
          : lastOpenedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      willDeleteAt: willDeleteAt == freezed
          ? _value.willDeleteAt
          : willDeleteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
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
            other is _Memo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.lastModifiedAt, lastModifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.lastOpenedAt, lastOpenedAt) &&
            const DeepCollectionEquality()
                .equals(other.willDeleteAt, willDeleteAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(lastModifiedAt),
      const DeepCollectionEquality().hash(lastOpenedAt),
      const DeepCollectionEquality().hash(willDeleteAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$MemoCopyWith<_Memo> get copyWith =>
      __$MemoCopyWithImpl<_Memo>(this, _$identity);
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
  String get id => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime get lastModifiedAt => throw _privateConstructorUsedError;
  @override
  DateTime get lastOpenedAt => throw _privateConstructorUsedError;
  @override
  DateTime? get willDeleteAt => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MemoCopyWith<_Memo> get copyWith => throw _privateConstructorUsedError;
}
