import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:private_markdown_writer/widgets/component/memo_list/parts/card.dart';

import '../../../../domain/entities/memo/memo.dart';
import '../../../../store/loading_state.dart';
import '../../parts/loading.dart';

class MemoListWidgets extends StatelessWidget {
  final List<Memo> memoList;
  final LoadingState loadingState;
  final Function(Memo memo) selectMemo;
  final Function(Memo memo) makeDeleteMemo;
  final Widget errorWidget;
  const MemoListWidgets({
    required this.memoList,
    required this.loadingState,
    required this.selectMemo,
    required this.makeDeleteMemo,
    required this.errorWidget,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memoListNoItem = AppLocalizations.of(context)?.memoListNoItem ?? "";
    final memoListActionDelete = AppLocalizations.of(context)?.memoListActionDelete ?? "";
    final memoListActionOpen = AppLocalizations.of(context)?.memoListActionOpen ?? "";

    const externalPaddingInset = EdgeInsets.all(8);

    if (loadingState == LoadingState.initial || loadingState == LoadingState.loading) {
      return const LoadingWidget();
    } else if (loadingState == LoadingState.failed) {
      return Center(child: errorWidget);
    }
    if (memoList.isEmpty) {
      return Padding(
        padding: externalPaddingInset,
        child: Text(memoListNoItem),
      );
    }
    return ListView(
        padding: externalPaddingInset,
        children:memoList.map((memo) => MemoListCardPage(
          key: Key(memo.id),
          memo: memo,
          actions: [
            CardAction(
              icons: Icons.file_open,
              label: memoListActionOpen,
              action: selectMemo,
            ),
            CardAction(
              icons: Icons.delete,
              label: memoListActionDelete,
              action: makeDeleteMemo,
            ),
          ],
        )).toList()
    );
  }
}
