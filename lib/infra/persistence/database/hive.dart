import 'dart:io';

import 'package:hive_flutter/adapters.dart';

import '../../../domain/entities/memo/memo.dart';
import '../entities/memo/persistent_memo.dart';
import '../entities/persistent_template.dart';
import 'interface.dart';

class PersistentHiveDatabase implements PersistenceDatabase {
  Box? box;

  Future<Box> _getBox() async {
    if (box == null) {
      try {
        if (!Platform.environment.containsKey('FLUTTER_TEST')) {
          await Hive.initFlutter();
        }
      } catch(e) {
        await Hive.initFlutter();
      }

      Hive.registerAdapter(PersistentMemoAdapter());

      box = await Hive.openBox("database");
    }
    return Future<Box>.value(box);
  }

  dynamic _fromPersistent(DataWithId dataWithId) {
    if (dataWithId is PersistentMemo) {
      final persistent = dataWithId;
      return Memo(
        id: persistent.id,
        createdAt: persistent.createdAt,
        lastOpenedAt: persistent.lastOpenedAt,
        lastModifiedAt: persistent.lastModifiedAt,
        willDeleteAt: persistent.willDeleteAt,
        title: persistent.title,
        content: persistent.content,
      );
    } else {
      throw Exception("unsupported type ${dataWithId.runtimeType}!");
    }
  }

  DataWithId _toPersistent<T>(T dataWithId) {
    if (dataWithId is Memo) {
      final memo = dataWithId;
      return PersistentMemo(
        id: memo.id,
        createdAt: memo.createdAt,
        lastOpenedAt: memo.lastOpenedAt,
        lastModifiedAt: memo.lastModifiedAt,
        willDeleteAt: memo.willDeleteAt,
        title: memo.title,
        content: memo.content,
      );
    } else {
      throw Exception("unsupported type ${dataWithId.runtimeType}!");
    }
  }

  @override
  Future<void> store<T>(T entity) async {
    final persistent = _toPersistent<T>(entity);
    final box = await _getBox();
    final id = persistent.getId();
    box.put(id, persistent);
  }

  @override
  Future<void> storeAll<T>(Iterable<T> entities) async {
    for (final entity in entities) {
      store<T>(entity);
    }
  }

  @override
  Future<T?> load<T>(String id) async {
    final box = await _getBox();
    final persistent = box.get(id);
    if (persistent == null) {
      return null;
    }
    return _fromPersistent(persistent);
  }

  @override
  Future<Iterable<T>> loadAll<T>() async {
    final box = await _getBox();
    return box.values.map((b) => _fromPersistent(b)).whereType<T>();
  }

  @override
  Future<void> delete<T>(T entity) async {
    final persistent = _toPersistent<T>(entity);
    final box = await _getBox();
    final id = persistent.getId();
    box.delete(id);
  }
}
