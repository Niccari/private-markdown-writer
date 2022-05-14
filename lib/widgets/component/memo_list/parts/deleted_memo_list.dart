import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:private_markdown_writer/widgets/component/memo_list/parts/card.dart';

import '../../../../domain/entities/memo/memo.dart';
import '../../../../store/loading_state.dart';
import '../../parts/loading.dart';

class DeletedMemoListWidgets extends StatelessWidget {
  final List<Memo> deletedMemoList;
  final LoadingState loadingState;
  final Function(Memo memo) restoreMemo;
  final Function(Memo memo) permanentDeleteMemo;
  final Widget errorWidget;
  const DeletedMemoListWidgets({
    required this.loadingState,
    required this.deletedMemoList,
    required this.restoreMemo,
    required this.permanentDeleteMemo,
    required this.errorWidget,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memoDeletedListNoItem = AppLocalizations.of(context)?.memoDeletedListNoItem ?? "";
    final memoDeletedListActionRestore = AppLocalizations.of(context)?.memoDeletedListActionRestore ?? "";
    final memoDeletedListActionDeletePermanent = AppLocalizations.of(context)?.memoDeletedListActionDeletePermanent ?? "";

    const externalPaddingInset = EdgeInsets.all(8);

    if (loadingState == LoadingState.initial || loadingState == LoadingState.loading) {
      return const LoadingWidget();
    } else if (loadingState == LoadingState.failed) {
      return Center(child: errorWidget);
    }
    if (deletedMemoList.isEmpty) {
      return Padding(
        padding: externalPaddingInset,
        child: Text(memoDeletedListNoItem),
      );
    }
    return ListView(
        padding: externalPaddingInset,
        children:deletedMemoList.map((memo) => MemoListCardPage(
          key: Key(memo.id),
          memo: memo,
          actions: [CardAction(
            icons: Icons.restore,
            label: memoDeletedListActionRestore,
            action: restoreMemo,
          ), CardAction(
            icons: Icons.delete_forever,
            label: memoDeletedListActionDeletePermanent,
            action: permanentDeleteMemo,
          )],
        )).toList()
    );
  }
}
