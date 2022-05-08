// dart:io does not supports Platform.localeName on the web platform.
import 'package:universal_io/io.dart';

import 'package:private_markdown_writer/domain/entities/memo/memo.dart';
import 'package:private_markdown_writer/domain/repository/memo/interface.dart';
import 'package:private_markdown_writer/infra/persistence/database/interface.dart';

import '../../../config.dart';
import '../../../libs/id_generator/id_generator.dart';


class MemoHiveRepository implements MemoRepository{
  final PersistenceDatabase database;
  final IdGenerator idGenerator;

  MemoHiveRepository({
    required this.database,
    required this.idGenerator
  });

  @override
  Future<Memo?> loadMemo(String memoId) {
    return database.load<Memo?>(memoId);
  }

  @override
  Future<List<Memo>> loadUndeletedMemos() async {
    final memos = await database.loadAll<Memo>();
    final undeletedMemos = memos.where((m) => m.willDeleteAt == null).toList();
    undeletedMemos.sort(
            (a, b) => a.lastModifiedAt.millisecondsSinceEpoch > b.lastModifiedAt.millisecondsSinceEpoch ? -1 : 1
    );
    return undeletedMemos;
  }

  @override
  Future<List<Memo>> loadDeletedMemos() async {
    final memos = await database.loadAll<Memo>();
    return memos.where((m) => m.willDeleteAt != null).toList();
  }

  Memo _createMemo(Memo? prevMemo, Memo memo) {
    final now = DateTime.now();
    if (prevMemo == null) {
      final newMemo = Memo(
          id: memo.id,
          createdAt: now,
          lastOpenedAt: now,
          lastModifiedAt: now,
          willDeleteAt: null,
          title: memo.title,
          content: memo.content
      );
      return newMemo;
    } else {
      final newMemo = prevMemo.copyWith(
        lastModifiedAt: now,
        lastOpenedAt: memo.lastOpenedAt,
        willDeleteAt: memo.willDeleteAt,
        title: memo.title,
        content: memo.content
      );
      return newMemo;
    }
  }

  @override
  Future<void> deleteMemo(Memo memo) async {
    database.delete(memo);
  }

  @override
  Future<void> storeMemo(Memo memo) async {
    final prevMemo = await loadMemo(memo.id);
    final newMemo = _createMemo(prevMemo, memo);
    database.store(newMemo);
  }

  @override
  Future<Memo> createMemo() {
    final locale = Platform.localeName;
    final title = (() {
      if (locale.contains("en")) {
        return "Sample memo";
      }
      return "サンプルメモ";
    })();
    final content = (() {
      if (locale.contains("en")) {
        return '''
# Sample heading
## test
Test input. You can write memo with the Markdown format(GFM).

You also able to write multiline with  
trailing two spaces.

[Wikipedia](https://www.wikipedia.org/)
      ''';
      }
      return '''
# サンプル見出し
## test
テスト入力です。Markdown形式(GFM準拠)でメモをとることができます。

文の末尾に半角スペースを入れると、  
改行できます。

[Wikipedia](https://www.wikipedia.org/)
      ''';
    })();
    final now = DateTime.now();
    return Future<Memo>.value(Memo(
      id: idGenerator.generate(),
      title: title,
      content: content,
      createdAt: now,
      lastModifiedAt: now,
      lastOpenedAt: now,
      willDeleteAt: null,
    ));
  }

  @override
  Future<Memo> updateOpenedAt(Memo memo) {
    return Future<Memo>.value(memo.copyWith(
      lastOpenedAt: DateTime.now(),
    ));
  }

  @override
  Future<Memo> makeDeleteMemo(Memo memo) {
    final willDeleteAt =
      DateTime.now().add(const Duration(days: Constants.memoWillDeleteDays));
    return Future<Memo>.value(memo.copyWith(
      willDeleteAt: willDeleteAt,
    ));
  }

  @override
  Future<Memo> updateModifiedAt(Memo memo) {
    return Future<Memo>.value(memo.copyWith(
      lastModifiedAt: DateTime.now(),
    ));
  }

  @override
  Future<Memo> restoreMemo(Memo memo) {
    return Future<Memo>.value(memo.copyWith(
        willDeleteAt: null
    ));
  }

  @override
  Future<void> deleteExpiredMemos() async {
    final deletedMemos = await loadDeletedMemos();
    final now = DateTime.now();
    final expiredMemos =
      deletedMemos.where((m) =>
        m.willDeleteAt?.isBefore(now) == true
      );
    for (final memo in expiredMemos) {
      deleteMemo(memo);
    }
  }
}