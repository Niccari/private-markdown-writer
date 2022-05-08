
import 'package:uuid/uuid.dart';

final idGenerator = IdGenerator();

class IdGenerator {
  late final Uuid _uuid;

  IdGenerator() {
    _uuid = const Uuid();
  }

  String generate() => _uuid.v4();
}
