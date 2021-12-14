import 'package:get/get.dart';
import 'package:todo_app/db/db_helper.dart';
import 'package:todo_app/model/task.dart';

class TaskController extends GetxController {
  final RxList<Task> tasksList = <Task>[].obs;

  Future<int> addNewTask({required Task task}) {
    print('From Controller${task.date}');
    return DBHelper.saveNewTask(task: task);
  }

  Future<void> getAllTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    tasksList
        .assignAll(tasks.map((element) => Task.fromJson(element)).toList());
  }

  void deleteSelectedTask({required Task task}) async {
    await DBHelper.deleteSelectedTask(task);
    getAllTasks();
  }

  void markTaskAsCompleted({required int taskID}) async {
    await DBHelper.updateSpecificRow(taskID: taskID);
    getAllTasks();
  }
}
