import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'markdown_builder/header.dart';

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
            MarkdownBody(
              data: content ?? memoListLoading,
              onTapLink: (_, url, __){
                if (url != null) {
                  final uri = Uri.parse(url);
                  launchUrl(uri);
                }
              },
              builders: {
                'h1': CustomHeader1Builder(content: content, onCopyRequested: _onCopyRequested),
                'h2': CustomHeader2Builder(content: content, onCopyRequested: _onCopyRequested),
                'h3': CustomHeader3Builder(content: content, onCopyRequested: _onCopyRequested),
                'h4': CustomHeader4Builder(content: content, onCopyRequested: _onCopyRequested),
                'h5': CustomHeader5Builder(content: content, onCopyRequested: _onCopyRequested),
                'h6': CustomHeader6Builder(content: content, onCopyRequested: _onCopyRequested)
              },
            )
          ],
        )
      )
    );
  }
}
