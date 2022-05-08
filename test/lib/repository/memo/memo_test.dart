import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:private_markdown_writer/domain/entities/memo/memo.dart';
import 'package:private_markdown_writer/domain/repository/memo/index.dart';
import 'package:private_markdown_writer/domain/repository/memo/interface.dart';
import 'package:private_markdown_writer/infra/persistence/database/hive.dart';
import 'package:private_markdown_writer/libs/id_generator/id_generator.dart';

void main() {
  late final MemoRepository _repository;
  final _someDate = DateTime(2020, 1, 1, 0, 0, 0);
  final _sampleMemo = Memo(
    id: "0",
    title: "title",
    content: "content",
    createdAt: _someDate,
    lastModifiedAt: _someDate,
    lastOpenedAt: _someDate,
    willDeleteAt: null,
  );

  setUpAll(() async {
    await setUpTestHive();
    final _database = PersistentHiveDatabase();
    _repository = MemoHiveRepository(
        database: _database,
        idGenerator: idGenerator
    );
  });

  tearDownAll(() async {
    await tearDownTestHive();
  });

  test('store and load memo', () async {
    const memoId = "2";
    await _repository.storeMemo(_sampleMemo.copyWith(
      id: memoId
    ));

    final memo = await _repository.loadMemo(memoId);
    if (memo == null) {
      throw Exception("memo is null!");
    }
    expect(memo.id, memoId);
    expect(memo.title, "title");
    expect(memo.content, "content");
  });

  test('load undeletedMemoList and deleted one', () async {
    const memoIds = ["2", "3", "4", "5"];
    for (final memoId in memoIds) {
      await _repository.storeMemo(_sampleMemo.copyWith(
          id: memoId
      ));
    }

    final memo = await _repository.loadMemo("4");
    if (memo == null) {
      throw Exception("memo is null!");
    }
    final deleteMemo = await _repository.makeDeleteMemo(memo);
    await _repository.storeMemo(deleteMemo);

    final memoList = await _repository.loadUndeletedMemos();
    final deletedMemoList = await _repository.loadDeletedMemos();

    expect(memoList.map((m) => m.id).toList(), ["5", "3", "2"]);
    expect(deletedMemoList.map((m) => m.id).toList(), ["4"]);
  });
}
