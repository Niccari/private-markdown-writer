import '../../entities/memo/memo.dart';

abstract class MemoRepository {
  Future<Memo?> loadMemo(String memoId);
  Future<List<Memo>> loadUndeletedMemos();
  Future<List<Memo>> loadDeletedMemos();
  Future<Memo> createMemo();
  Future<Memo> updateOpenedAt(Memo memo);
  Future<Memo> updateModifiedAt(Memo memo);
  Future<Memo> makeDeleteMemo(Memo memo);
  Future<Memo> restoreMemo(Memo memo);
  Future<void> deleteMemo(Memo memo);
  Future<void> storeMemo(Memo memo);
  Future<void> deleteExpiredMemos();
}