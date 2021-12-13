import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? taskDB;
  static const int dbVersion = 1;
  static const String tabelName = 'tasks';

  static Future initDB() async {
    if (taskDB != null) {
      print('Task Database Initialized');
      return;
    } else {
      try {
        String dbPath = await getDatabasesPath() + "task.db";
        taskDB = await openDatabase(
          dbPath,
          version: dbVersion,
          onCreate: (db, version) async {
            await db.execute('CREATE TABLE $tabelName('
                'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                'title STRING, note TEXT, date STRING, '
                'startTime STRING, endTime STRING, '
                'remind INTEGER, repeat STRING, '
                'color INTEGER, '
                'isComplete INTEGER)');
          },
        );
        print("Database Opened Successfully");
      } catch (error) {
        print("Intial DB Error $error");
      }
    }
  }
}
