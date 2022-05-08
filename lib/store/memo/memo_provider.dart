import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../container.dart';
import '../../domain/entities/memo/memo.dart';
import '../../usecase/memo/memo.dart';
import '../loading_state.dart';
import 'memo_state.dart';

final memoStateProvider =
StateNotifierProvider<EditorNotifier, MemoState>(
  (ref) => EditorNotifier(memoUseCase),
);

final memoProvider = Provider.autoDispose((ref) {
  return ref.watch(memoStateProvider).memo;
});

class EditorNotifier extends StateNotifier<MemoState> {
  final MemoUseCase memoUseCase;

  EditorNotifier(this.memoUseCase) : super(MemoState.initial()) {
    _loadMemoListAndDeletedMemoList();
  }

  void _loadMemoListAndDeletedMemoList() async {
    _setLoadingState(LoadingState.loading);
    try {
      await memoUseCase.deleteExpiredMemos();
      final memoList = await memoUseCase.loadUndeletedMemos();
      _setMemoList(memoList);
      if (memoList.isEmpty) {
        createMemo(memoList);
      } else {
        _setMemo(memoList.first);
      }

      final deletedMemoList = await memoUseCase.loadDeletedMemos();
      _setDeletedMemoList(deletedMemoList);
      _setLoadingState(LoadingState.ready);
    } catch (e) {
      _setLoadingState(LoadingState.failed);
    }
  }

  // Action Creators
  void updateTitle(Memo memo, String title) {
    _setMemo(memo.copyWith(
        title: title
    ));
  }

  void updateContent(Memo memo, String content) {
    _setMemo(memo.copyWith(
        content: content
    ));
  }

  void storeMemo(Memo memo, List<Memo> memoList) async {
    try {
      final newMemo = await memoUseCase.updateModifiedAt(memo);

      final replacedMemoList = [
        newMemo,
        ...[...memoList]..removeWhere((m) => m.id == memo.id)
      ];
      _setMemoList(replacedMemoList);
    } catch(e) {
      // TODO(Niccari): Error handling
    }
  }

  void createMemo(List<Memo> memoList) async {
    _setMemo(await memoUseCase.createMemo());
  }

  void openMemo(Memo memo, List<Memo> memoList) async {
    try {
      final newMemo = await memoUseCase.updateOpenedAt(memo);

      final foundMemoIndex = memoList.indexWhere((m) => m.id == memo.id);
      final newMemoList = [...memoList];
      // foundMemoIndex must be >= 0.
      newMemoList[foundMemoIndex] = newMemo;
      _setMemoAndMemoList(newMemo, newMemoList);
    } catch(e) {
      // TODO(Niccari): Error handling
    }
  }

  void makeDeleteMemo(Memo memo, List<Memo> memoList, List<Memo> deletedMemoList) async {
    try {
      final newMemo = await memoUseCase.makeDeleteMemo(memo);
      final removedMemoList = [...memoList]..removeWhere((m) => m.id == memo.id);
      final newDeletedMemoList = [newMemo, ...deletedMemoList];
      if (removedMemoList.isEmpty) {
        _setMemoAll(null, removedMemoList, newDeletedMemoList);
        createMemo(removedMemoList);
      } else {
        _setMemoAll(removedMemoList.first, removedMemoList, newDeletedMemoList);
      }
    } catch(e) {
      // TODO(Niccari): Error handling
    }
  }

  void restoreMemo(Memo memo, List<Memo> memoList, List<Memo> deletedMemoList) async {
    try {
      final newMemo = await memoUseCase.restoreMemo(memo);
      _setMemoListAll(
          [newMemo, ...memoList],
          [...deletedMemoList]..removeWhere((m) => m.id == newMemo.id)
      );
    } catch(e) {
      // TODO(Niccari): Error handling
    }
  }

  void permanentDeleteMemo(Memo memo, List<Memo> deletedMemoList) async {
    try {
      await memoUseCase.deleteMemo(memo);
      _setDeletedMemoList([...deletedMemoList]..removeWhere((m) => m.id == memo.id));
    } catch(e) {
      // TODO(Niccari): Error handling
    }
  }

  // Reducer
  void _setLoadingState(LoadingState loadingState) => state = state.copyWith(
    loadingState: loadingState,
  );

  void _setMemo(Memo memo) => state = state.copyWith(
    memo: memo,
  );

  void _setDeletedMemoList(List<Memo> deletedMemoList) => state = state.copyWith(
    deletedMemoList: deletedMemoList,
  );

  void _setMemoList(List<Memo> memoList) => state = state.copyWith(
    memoList: memoList,
  );

  void _setMemoAndMemoList(Memo? memo, List<Memo> memoList) => state = state.copyWith(
    memo: memo,
    memoList: memoList,
  );

  void _setMemoListAll(List<Memo> memoList, List<Memo> deletedMemoList) => state = state.copyWith(
    memoList: memoList,
    deletedMemoList: deletedMemoList
  );

  void _setMemoAll(Memo? memo, List<Memo> memoList, List<Memo> deletedMemoList) => state = state.copyWith(
    memo: memo,
    memoList: memoList,
    deletedMemoList: deletedMemoList
  );
}