import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    //special function to intiate database
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "news.db");
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {}

  _onCreate(Database db, int version) async {
    await db.execute('''
   CREATE TABLE "news"(
     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
     "new" TEXT NOT NULL,
     "image" TEXT NOT NULL,
     "question" TEXT NOT NULL,
     "answer" TEXT NOT NULL
   )
   ''');
    print("create");
  }

  //select
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  //insert
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  //update
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  //delete
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
