import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/memo/memo.dart';
import '../../../../store/memo/memo_provider.dart';
import '../../../component/memo_list/parts/memo_list.dart';

class MemoListWidgetsContainer extends ConsumerWidget {
  final Widget errorWidget;
  const MemoListWidgetsContainer({
    Key? key,
    required this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoList = ref.watch(memoStateProvider).memoList;
    final loadingState = ref.watch(memoStateProvider).loadingState;

    _selectMemo(Memo memo) {
      final memoList = ref.read(memoStateProvider).memoList;
      ref.read(memoStateProvider.notifier).openMemo(memo, memoList);
      Navigator.pushNamed(context, '/');
    }

    makeDeleteMemo(Memo memo) {
      final memoList = ref.read(memoStateProvider).memoList;
      final deletedMemoList = ref.read(memoStateProvider).deletedMemoList;
      ref.read(memoStateProvider.notifier).makeDeleteMemo(memo, memoList, deletedMemoList);
    }

    return MemoListWidgets(
      memoList: memoList,
      loadingState: loadingState,
      selectMemo: _selectMemo,
      makeDeleteMemo: makeDeleteMemo,
      errorWidget: errorWidget,
    );
  }
}
