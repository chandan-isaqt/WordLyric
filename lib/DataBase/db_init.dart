import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class DbHelper {
  DbHelper._internal();
  static final DbHelper d = DbHelper._internal();

  factory DbHelper() {
    return d;
  }

  late Database db;

  Future<void> init() async {
    final Directory path_provider = await getApplicationDocumentsDirectory();
    final dbpath = path.join(path_provider.path, "wordlyric.db");
    db = sqlite3.open(dbpath);
    favcreate();
    saveHistory();
  }

  void favcreate() {
    // =========favHistory======
    db.execute('''
CREATE TABLE IF NOT EXISTS favHistory (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  word TEXT,
  definition TEXT
)
''');
  }

  void saveHistory() {
    // =================saveHistory=======
    db.execute('''
    CREATE TABLE IF NOT EXISTS saveHistory (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      save TEXT
    )
    ''');
  }
}
