// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemoState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  Memo? get memo => throw _privateConstructorUsedError;
  List<Memo> get memoList => throw _privateConstructorUsedError;
  List<Memo> get deletedMemoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoStateCopyWith<MemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoStateCopyWith<$Res> {
  factory $MemoStateCopyWith(MemoState value, $Res Function(MemoState) then) =
      _$MemoStateCopyWithImpl<$Res>;
  $Res call(
      {LoadingState loadingState,
      Memo? memo,
      List<Memo> memoList,
      List<Memo> deletedMemoList});

  $MemoCopyWith<$Res>? get memo;
}

/// @nodoc
class _$MemoStateCopyWithImpl<$Res> implements $MemoStateCopyWith<$Res> {
  _$MemoStateCopyWithImpl(this._value, this._then);

  final MemoState _value;
  // ignore: unused_field
  final $Res Function(MemoState) _then;

  @override
  $Res call({
    Object? loadingState = freezed,
    Object? memo = freezed,
    Object? memoList = freezed,
    Object? deletedMemoList = freezed,
  }) {
    return _then(_value.copyWith(
      loadingState: loadingState == freezed
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo?,
      memoList: memoList == freezed
          ? _value.memoList
          : memoList // ignore: cast_nullable_to_non_nullable
              as List<Memo>,
      deletedMemoList: deletedMemoList == freezed
          ? _value.deletedMemoList
          : deletedMemoList // ignore: cast_nullable_to_non_nullable
              as List<Memo>,
    ));
  }

  @override
  $MemoCopyWith<$Res>? get memo {
    if (_value.memo == null) {
      return null;
    }

    return $MemoCopyWith<$Res>(_value.memo!, (value) {
      return _then(_value.copyWith(memo: value));
    });
  }
}

/// @nodoc
abstract class _$$_MemoStateCopyWith<$Res> implements $MemoStateCopyWith<$Res> {
  factory _$$_MemoStateCopyWith(
          _$_MemoState value, $Res Function(_$_MemoState) then) =
      __$$_MemoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LoadingState loadingState,
      Memo? memo,
      List<Memo> memoList,
      List<Memo> deletedMemoList});

  @override
  $MemoCopyWith<$Res>? get memo;
}

/// @nodoc
class __$$_MemoStateCopyWithImpl<$Res> extends _$MemoStateCopyWithImpl<$Res>
    implements _$$_MemoStateCopyWith<$Res> {
  __$$_MemoStateCopyWithImpl(
      _$_MemoState _value, $Res Function(_$_MemoState) _then)
      : super(_value, (v) => _then(v as _$_MemoState));

  @override
  _$_MemoState get _value => super._value as _$_MemoState;

  @override
  $Res call({
    Object? loadingState = freezed,
    Object? memo = freezed,
    Object? memoList = freezed,
    Object? deletedMemoList = freezed,
  }) {
    return _then(_$_MemoState(
      loadingState: loadingState == freezed
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo?,
      memoList: memoList == freezed
          ? _value._memoList
          : memoList // ignore: cast_nullable_to_non_nullable
              as List<Memo>,
      deletedMemoList: deletedMemoList == freezed
          ? _value._deletedMemoList
          : deletedMemoList // ignore: cast_nullable_to_non_nullable
              as List<Memo>,
    ));
  }
}

/// @nodoc

class _$_MemoState implements _MemoState {
  const _$_MemoState(
      {required this.loadingState,
      required this.memo,
      required final List<Memo> memoList,
      required final List<Memo> deletedMemoList})
      : _memoList = memoList,
        _deletedMemoList = deletedMemoList;

  @override
  final LoadingState loadingState;
  @override
  final Memo? memo;
  final List<Memo> _memoList;
  @override
  List<Memo> get memoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memoList);
  }

  final List<Memo> _deletedMemoList;
  @override
  List<Memo> get deletedMemoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletedMemoList);
  }

  @override
  String toString() {
    return 'MemoState(loadingState: $loadingState, memo: $memo, memoList: $memoList, deletedMemoList: $deletedMemoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemoState &&
            const DeepCollectionEquality()
                .equals(other.loadingState, loadingState) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other._memoList, _memoList) &&
            const DeepCollectionEquality()
                .equals(other._deletedMemoList, _deletedMemoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingState),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(_memoList),
      const DeepCollectionEquality().hash(_deletedMemoList));

  @JsonKey(ignore: true)
  @override
  _$$_MemoStateCopyWith<_$_MemoState> get copyWith =>
      __$$_MemoStateCopyWithImpl<_$_MemoState>(this, _$identity);
}

abstract class _MemoState implements MemoState {
  const factory _MemoState(
      {required final LoadingState loadingState,
      required final Memo? memo,
      required final List<Memo> memoList,
      required final List<Memo> deletedMemoList}) = _$_MemoState;

  @override
  LoadingState get loadingState;
  @override
  Memo? get memo;
  @override
  List<Memo> get memoList;
  @override
  List<Memo> get deletedMemoList;
  @override
  @JsonKey(ignore: true)
  _$$_MemoStateCopyWith<_$_MemoState> get copyWith =>
      throw _privateConstructorUsedError;
}
