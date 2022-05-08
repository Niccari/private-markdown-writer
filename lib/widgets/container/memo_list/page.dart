import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../store/memo/memo_provider.dart';
import '../../component/memo_list/page.dart';

class MemoListPageContainer extends ConsumerWidget {

  const MemoListPageContainer({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(memoStateProvider).loadingState;

    _createMemo() {
      final memoList = ref.read(memoStateProvider).memoList;
      ref.read(memoStateProvider.notifier).createMemo(memoList);
      Navigator.pushNamed(context, '/');
    }

    return MemoListPage(
      loadingState: loadingState,
      createMemo: _createMemo,
    );
  }
}
