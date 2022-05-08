import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:private_markdown_writer/widgets/component/memo_list/parts/card.dart';

import '../../../../domain/entities/memo/memo.dart';

class DeletedMemoListWidgets extends StatelessWidget {
  final List<Memo> deletedMemoList;
  final Function(Memo memo) restoreMemo;
  final Function(Memo memo) permanentDeleteMemo;
  const DeletedMemoListWidgets({
    required this.deletedMemoList,
    required this.restoreMemo,
    required this.permanentDeleteMemo,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memoDeletedListNoItem = AppLocalizations.of(context)?.memoDeletedListNoItem ?? "";
    final memoDeletedListActionRestore = AppLocalizations.of(context)?.memoDeletedListActionRestore ?? "";
    final memoDeletedListActionDeletePermanent = AppLocalizations.of(context)?.memoDeletedListActionDeletePermanent ?? "";

    const externalPaddingInset = EdgeInsets.all(8);

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
