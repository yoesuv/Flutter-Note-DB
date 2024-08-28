import 'package:flutter_note/main.dart';
import 'package:objectbox/objectbox.dart';

abstract class DbRepository<T> {
  late final _box = Box<T>(appObjectBox.store);

  Future<List<T>> getAllData() async {
    return _box.getAll();
  }

  Future<void> insert(T data) async {
    await _box.putAsync(data, mode: PutMode.insert);
  }

  Future<void> update(T data) async {
    await _box.putAsync(data, mode: PutMode.update);
  }

  Future<void> delete(int id) async {
    await _box.removeAsync(id);
  }

  Future<void> deleteAll() async {
    await _box.removeAllAsync();
  }
}
