import 'package:dictonary/DataBase/db_init.dart';


Future<void> deleteSave(String word) async {
  final db = DbHelper();
  // await db.init();

  db.db.execute('''DELETE FROM saveHistory WHERE save = '$word' ''');
}
