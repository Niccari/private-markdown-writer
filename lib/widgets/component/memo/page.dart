import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../container/memo/parts/editor.dart';
import '../../container/memo/parts/preview.dart';

class MemoPage extends StatelessWidget {
  final Function() openMemoList;
  final Function() storeMemo;

  const MemoPage({
    required this.openMemoList,
    required this.storeMemo,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memoTitle = AppLocalizations.of(context)?.memoTitle ?? "";
    final memoTabEditor = AppLocalizations.of(context)?.memoTabEditor ?? "";
    final memoTabPreview = AppLocalizations.of(context)?.memoTabPreview ?? "";

    const fabPaddingInset = EdgeInsets.all(8);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(memoTitle),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: memoTabEditor),
              Tab(text: memoTabPreview),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            EditorWidgetContainer(),
            PreviewWidgetContainer(),
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: "openMemoList",
              child: const Icon(Icons.list),
              onPressed: openMemoList,
            ),
            const Padding(padding: fabPaddingInset),
            FloatingActionButton(
              heroTag: "storeMemo",
              child: const Icon(Icons.save),
              onPressed: storeMemo,
            )
          ],
        ),
      ),
    );
  }
}
