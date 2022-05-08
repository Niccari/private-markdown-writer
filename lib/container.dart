
import 'package:private_markdown_writer/usecase/memo/memo.dart';

import 'domain/repository/memo/index.dart';
import 'infra/persistence/database/hive.dart';
import 'libs/id_generator/id_generator.dart';

final _database = PersistentHiveDatabase();
final _memoRepository = MemoHiveRepository(
    database: _database,
    idGenerator: idGenerator
);
final memoUseCase = MemoUseCase(memoRepository: _memoRepository);
