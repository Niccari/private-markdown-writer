import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';

@freezed
class Memo with _$Memo{
  const factory Memo(
      {
        required String id,
        required DateTime createdAt,
        required DateTime lastModifiedAt,
        required DateTime lastOpenedAt,
        required DateTime? willDeleteAt,
        required String title,
        required String content,
      }) = _Memo;
}
