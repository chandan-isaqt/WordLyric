import 'package:dictonary/DataBase/db_init.dart';

Future<void> insertFavdata(String word, String defination) async {
  final db = DbHelper();
  // await db.init();

  db.db.execute(
    '''INSERT INTO favHistory (word, definition) VALUES ('$word','$defination') ''',
  );
}

Future<void> saveHistoryfun(String saveWord) async {
  final db = DbHelper();

  db.db.execute('''INSERT INTO saveHistory (save) VALUES ('$saveWord')''');
}
