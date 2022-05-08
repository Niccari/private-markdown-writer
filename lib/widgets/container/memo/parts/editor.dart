import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/memo/memo_provider.dart';
import '../../../component/memo/parts/editor.dart';

class EditorWidgetContainer extends ConsumerWidget {
  const EditorWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(memoProvider);
    void _onTitleChanged (String text) {
      final memo = ref.read(memoStateProvider).memo;
      if (memo == null) {
        return;
      }
      ref.read(memoStateProvider.notifier).updateTitle(memo, text);
    }

    void _onContentChanged (String text) {
      final memo = ref.read(memoStateProvider).memo;
      if (memo == null) {
        return;
      }
      ref.read(memoStateProvider.notifier).updateContent(memo, text);
    }

    return EditorWidget(
      key: Key(memo?.id ?? ""),
      title: memo?.title ?? "読込中...",
      content: memo?.content ?? "読込中...",
      onTitleChanged: _onTitleChanged,
      onContentChanged: _onContentChanged,
    );
  }
}
