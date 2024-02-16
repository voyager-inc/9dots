import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final Box box;

  HiveService({required this.box});

  void save(String key, dynamic data) {
    box.put(key, data);
  }

  void update(String key, dynamic data) {
    save(key, data);
  }

  void delete(String key) {
    box.delete(key);
  }

  String getStr(String key) {
    return box.get(key) ?? '';
  }

  bool getBool(String key) {
    return box.get(key) ?? false;
  }

  void clear() {
    box.clear();
  }
}
