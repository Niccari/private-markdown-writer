import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:private_markdown_writer/widgets/component/memo/parts/preview.dart';

import '../../../../store/memo/memo_provider.dart';

class PreviewWidgetContainer extends StatelessWidget {
  const PreviewWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {
          final memo = ref.watch(memoProvider);
          return PreviewWidget(
            title: memo?.title ?? "読込中...",
            content: memo?.content ?? "読込中..."
          );
        }
    );
  }
}
