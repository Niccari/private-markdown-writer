import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../store/loading_state.dart';
import '../../parts/loading.dart';

class EditorWidget extends StatelessWidget {
  final String? title;
  final String? content;
  final LoadingState loadingState;
  final void Function(String text) onTitleChanged;
  final void Function(String text) onContentChanged;

  const EditorWidget({
    required this.title,
    required this.content,
    required this.loadingState,
    required this.onTitleChanged,
    required this.onContentChanged,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memoTitleName = AppLocalizations.of(context)?.memoTitleName ?? "";
    final memoTitleHint = AppLocalizations.of(context)?.memoTitleHint ?? "";
    final memoContentName = AppLocalizations.of(context)?.memoContentName ?? "";
    final memoContentHint = AppLocalizations.of(context)?.memoContentHint ?? "";

    const externalPaddingInset = EdgeInsets.all(8);
    const internalPaddingInset = EdgeInsets.all(4);
    const titleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16
    );
    const outlineInputBorder = OutlineInputBorder();

    if (loadingState == LoadingState.initial || loadingState == LoadingState.loading) {
      return const LoadingWidget();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              memoTitleName,
              style: titleTextStyle,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: outlineInputBorder,
                hintText: memoTitleHint,
              ),
              initialValue: title,
              onChanged: onTitleChanged,
            ),
            const Padding(padding: internalPaddingInset),
            Text(
              memoContentName,
              style: titleTextStyle,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: outlineInputBorder,
                hintText: memoContentHint,
              ),
              initialValue: content,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: onContentChanged,
            ),
          ],
        ),
      )
    );
  }
}
