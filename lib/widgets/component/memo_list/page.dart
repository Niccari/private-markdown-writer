import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:private_markdown_writer/widgets/container/memo_list/parts/deleted_memo_list.dart';
import 'package:private_markdown_writer/widgets/container/memo_list/parts/memo_list.dart';

import '../../../store/loading_state.dart';
import '../parts/error_text_widget.dart';

class MemoListPage extends StatelessWidget {
  final Function() createMemo;
  final Function() reloadMemo;
  final LoadingState loadingState;

  const MemoListPage({
    required this.loadingState,
    required this.createMemo,
    required this.reloadMemo,
    Key? key
  }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final memoListFailedToLoad = AppLocalizations.of(context)?.memoListFailedToLoad ?? "";
      final memoListTitle = AppLocalizations.of(context)?.memoListTitle ?? "";
      final memoListTabList = AppLocalizations.of(context)?.memoListTabList ?? "";
      final memoListTabDeletedList = AppLocalizations.of(context)?.memoListTabDeletedList ?? "";

      final errorWidget = ErrorTextWidget(
        errorText: memoListFailedToLoad,
        recoverActionText: "再読み込み",
        onActionPressed: () {
          reloadMemo();
        },
      );
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
          body: TabBarView(
            children: <Widget>[
              MemoListWidgetsContainer(
                errorWidget: errorWidget,
              ),
              DeletedMemoListWidgetsContainer(
                errorWidget: errorWidget
              ),
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
