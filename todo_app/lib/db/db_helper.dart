import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/task.dart';

class DBHelper {
  static Database? taskDB;
  static const int dbVersion = 1;
  static const String tabelName = 'tasks';

  static Future<void> initDB() async {
    if (taskDB != null) {
      print('Task Database Already Initialized');
      return;
    } else {
      try {
        String dbPath = await getDatabasesPath() + "task.db";
        taskDB = await openDatabase(
          dbPath,
          version: dbVersion,
          onCreate: (db, version) async {
            return db.execute('CREATE TABLE $tabelName('
                'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                'title STRING, note TEXT, date STRING, '
                'startTime STRING, endTime STRING, '
                'remind INTEGER, repeat STRING, '
                'color INTEGER, '
                'isCompleted INTEGER)');
          },
        );
        print("Database Opened Successfully");
      } catch (error) {
        print("Intial DB Error $error");
      }
    }
  }

  static Future<int> saveNewTask({required Task task}) async {
    print("Call Insert Function");
    return await taskDB!.insert(tabelName, task.toJson());
  }

  static Future<int> deleteSelectedTask(Task task) async {
    print("Call Delete Function");
    return await taskDB!
        .delete(tabelName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await taskDB!.query(tabelName);
  }

  static Future<int> updateSpecificRow({required int taskID}) async {
    print("Call Update Function");
    return await taskDB!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    ''', [1, taskID]);
  }
}
