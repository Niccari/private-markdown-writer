import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/memo/memo_provider.dart';
import '../../../component/memo/parts/editor.dart';

class EditorWidgetContainer extends ConsumerWidget {
  const EditorWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(memoProvider);
    final loadingState = ref.watch(memoStateProvider).loadingState;
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
      title: memo?.title,
      content: memo?.content,
      loadingState: loadingState,
      onTitleChanged: _onTitleChanged,
      onContentChanged: _onContentChanged,
    );
  }
}
