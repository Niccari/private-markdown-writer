import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:private_markdown_writer/store/memo/memo_provider.dart';

import '../../component/memo/page.dart';

class MemoPageContainer extends ConsumerWidget {
  const MemoPageContainer({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _openMemoList() {
      Navigator.pushNamed(context, '/list');
    }

    return Consumer(
        builder: (context, ref, _) {
          _storeMemo() {
            final memo = ref.read(memoStateProvider).memo;
            final memoList = ref.read(memoStateProvider).memoList;
            if (memo == null) {
              return;
            }
            ref.read(memoStateProvider.notifier).storeMemo(memo, memoList);
          }

          return MemoPage(
            openMemoList: _openMemoList,
            storeMemo: _storeMemo,
          );
        }
    );
  }
}
