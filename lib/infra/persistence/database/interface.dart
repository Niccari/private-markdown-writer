abstract class PersistenceDatabase {
  Future<void> store<T>(T entity);
  Future<void> storeAll<T>(Iterable<T> entities);
  Future<T?> load<T>(String id);
  Future<Iterable<T>> loadAll<T>();
  Future<void> delete<T>(T entity);
}