
import 'package:dictonary/DataBase/db_init.dart';

Future readFav() async {
  final db = DbHelper();

  final result = db.db.select('''SELECT * FROM favHistory''');

  return result;
}

Future readSaveHistory() async {
  final db = DbHelper();

  final result2 = db.db.select('''SELECT * FROM saveHistory''');

  return result2;
}
