import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../container/memo/parts/markdown_body.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({
    required this.title,
    required this.content,
    required this.onCopyRequested,
    Key? key
  }) : super(key: key);
  final String? title;
  final String? content;
  final Function(String) onCopyRequested;

  @override
  Widget build(BuildContext context) {
    final notifyMemoContentCopied = AppLocalizations.of(context)?.notifyMemoContentCopied ?? "";
    final memoListLoading = AppLocalizations.of(context)?.memoListLoading ?? "";

    const externalPaddingInset = EdgeInsets.all(8);
    const internalPaddingInset = EdgeInsets.all(10);
    const titleTextStyle = TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 24
    );

    void _onCopyRequested (String text) {
      onCopyRequested(text);
      final textSummary = text.substring(0, min(16, text.length)).replaceAll("\n", "");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$notifyMemoContentCopied ($textSummary...)"),
        duration: const Duration(seconds: 2),
      ));
    }

    if (title == null || content == null) {
      return Text(memoListLoading);
    }
    return SingleChildScrollView(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? memoListLoading,
              style: titleTextStyle,
            ),
            const Padding(padding: internalPaddingInset),
            MarkdownBodyHeaderCopiableContainer(
              content: content ?? memoListLoading,
              onCopyRequested: _onCopyRequested,
            ),
          ],
        )
      )
    );
  }
}
