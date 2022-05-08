import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:private_markdown_writer/widgets/container/memo_list/parts/deleted_memo_list.dart';
import 'package:private_markdown_writer/widgets/container/memo_list/parts/memo_list.dart';

import '../../../store/loading_state.dart';

class MemoListPage extends StatelessWidget {
  final Function() createMemo;
  final LoadingState loadingState;
  const MemoListPage({
    required this.loadingState,
    required this.createMemo,
    Key? key
  }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final memoListLoading = AppLocalizations.of(context)?.memoListLoading ?? "";
      final memoListFailedToLoad = AppLocalizations.of(context)?.memoListFailedToLoad ?? "";
      final memoListTitle = AppLocalizations.of(context)?.memoListTitle ?? "";
      final memoListTabList = AppLocalizations.of(context)?.memoListTabList ?? "";
      final memoListTabDeletedList = AppLocalizations.of(context)?.memoListTabDeletedList ?? "";

      if (loadingState == LoadingState.initial) {
        return Text(memoListLoading);
      } else if (loadingState == LoadingState.loading) {
        return Text(memoListLoading);
      } else if (loadingState == LoadingState.failed) {
        return Text(memoListFailedToLoad);
      }
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(memoListTitle),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: memoListTabList),
                Tab(text: memoListTabDeletedList),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              MemoListWidgetsContainer(),
              DeletedMemoListWidgetsContainer(),
            ],
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: "createMemo",
                child: const Icon(Icons.add),
                onPressed: createMemo,
              ),
            ],
          ),
        ),
      );
  }
}
