import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config.dart';
import '../../../../domain/entities/memo/memo.dart';

class CardAction {
  final IconData icons;
  final String label;
  final Function(Memo memo) action;
  const CardAction({
    required this.icons,
    required this.label,
    required this.action,
  });
}

class MemoListCardPage extends StatelessWidget {
  final Memo memo;
  final List<CardAction> actions;
  const MemoListCardPage({
    required this.memo,
    required this.actions,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentSummary = (() {
      if (memo.content.length > Constants.memoContentSummaryCounts) {
        return memo.content.substring(0, Constants.memoContentSummaryCounts) + "…";
      } else {
        return memo.content;
      }
    })();
    final willDeleteDays = (() {
      final willDeleteAt = memo.willDeleteAt;
      if (willDeleteAt == null) {
        return null;
      }
      return willDeleteAt.difference(DateTime.now()).inDays;
    })();
    String toDifferenceDateString(DateTime dateTime) {
      final diff = DateTime.now().difference(dateTime);
      if (diff.inDays > 30) {
        return AppLocalizations.of(context)?.monthsBefore(diff.inDays ~/ 30) ?? "";
      } else if (diff.inDays > 0) {
        return AppLocalizations.of(context)?.daysBefore(diff.inDays) ?? "";
      } else if (diff.inHours > 0) {
        return AppLocalizations.of(context)?.hoursBefore(diff.inHours) ?? "";
      }
      return AppLocalizations.of(context)?.minutesBefore(diff.inMinutes) ?? "";
    }

    final memoCardCreatedAt = AppLocalizations.of(context)?.memoCardCreatedAt(memo.createdAt) ?? "";
    final memoCardLastModifiedAt = AppLocalizations.of(context)?.memoCardLastModifiedAt(
        toDifferenceDateString(memo.lastModifiedAt)) ?? "";
    final memoCardLastOpenedAt = AppLocalizations.of(context)?.memoCardLastOpenedAt(
        toDifferenceDateString(memo.lastOpenedAt)) ?? "";
    final memoCardWillDeleteDays = AppLocalizations.of(context)?.memoCardWillDeleteDays(willDeleteDays ?? -1) ?? "";

    const cardTitleTextStyle = TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 18
    );
    const externalPaddingInset = EdgeInsets.all(16);
    const headingPaddingInset = EdgeInsets.all(8);
    const contentPaddingInset = EdgeInsets.all(4);
    return Card(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(memo.title, style: cardTitleTextStyle),
            const Padding(padding: contentPaddingInset),
            Text(contentSummary),
            const Padding(padding: headingPaddingInset),
            Text(memoCardCreatedAt),
            const Padding(padding: contentPaddingInset),
            Text(memoCardLastModifiedAt),
            const Padding(padding: contentPaddingInset),
            Text(memoCardLastOpenedAt),
            const Padding(padding: contentPaddingInset),
            if (willDeleteDays != null)
              Text(memoCardWillDeleteDays),
            if (willDeleteDays != null)
              const Padding(padding: contentPaddingInset),
            const Padding(padding: contentPaddingInset),
            Row(
                children: actions.map((action) => TextButton.icon(
                  icon: Icon(action.icons),
                  label: Text(action.label),
                  onPressed: () => action.action(memo),
                )).toList()
            )
          ],
        ),
      )
    );
  }
}