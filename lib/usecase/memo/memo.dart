import 'package:private_markdown_writer/domain/repository/memo/interface.dart';

import '../../domain/entities/memo/memo.dart';

class MemoUseCase {
  final MemoRepository memoRepository;

  MemoUseCase({required this.memoRepository});

  Future<Memo?> loadMemo(String memoId) {
    return memoRepository.loadMemo(memoId);
  }

  Future<List<Memo>> loadUndeletedMemos() {
    return memoRepository.loadUndeletedMemos();
  }

  Future<List<Memo>> loadDeletedMemos() {
    return memoRepository.loadDeletedMemos();
  }

  Future<Memo> createMemo() {
    return memoRepository.createMemo();
  }

  Future<Memo> updateModifiedAt(Memo memo) async {
    final newMemo = await memoRepository.updateModifiedAt(memo);
    storeMemo(newMemo);
    return newMemo;
  }

  Future<Memo> updateOpenedAt(Memo memo) async {
    final newMemo = await memoRepository.updateOpenedAt(memo);
    storeMemo(newMemo);
    return newMemo;
  }

  Future<Memo> makeDeleteMemo(Memo memo) async {
    final newMemo = await memoRepository.makeDeleteMemo(memo);
    storeMemo(newMemo);
    return newMemo;
  }

  Future<Memo> restoreMemo(Memo memo) async {
    final newMemo = await memoRepository.restoreMemo(memo);
    storeMemo(newMemo);
    return newMemo;
  }

  Future<void> deleteMemo(Memo memo) {
    return memoRepository.deleteMemo(memo);
  }

  Future<void> storeMemo(Memo memo) {
    return memoRepository.storeMemo(memo);
  }

  Future<void> deleteExpiredMemos() {
    return memoRepository.deleteExpiredMemos();
  }
}