import 'package:flutter/foundation.dart';
import 'package:todoList/dbHelper.dart';
import 'package:todoList/details.dart';

import 'dbHelper.dart';

class Task {
  int iD;
  final String name;
  bool isDone;

  Task({this.iD, this.name, this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }

  void give(int x) {
    iD = x;
  }
}

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  var dbHelper;

  void work() async {
    List<Employee> mp = await dbHelper.getEmployees();

    for (int i = 0; i < mp.length; i++) {
      bool x = (mp[i].isTrue == 1);
      Task tk = Task(iD: mp[i].id, name: mp[i].name, isDone: x);
      tasks.add(tk);
    }
    notifyListeners();
  }

  TaskData() {
    dbHelper = DBHelper();
    work();
  }

  void addtask(String str) async {
    Task tk = Task(name: str, isDone: false);

    int z = 0;
    Employee ee = Employee(name: str, isTrue: z);
    int x = await dbHelper.save(ee);
    tk.give(x);
    tasks.add(tk);
    notifyListeners();
  }

  void updateTask(Task id) async {
    int x = id.iD;
    int val = 0;
    id.toggleDone();
    if (id.isDone == true) val = 1;

    Employee ee = Employee(id: x, name: id.name, isTrue: val);

    await dbHelper.update(ee);

    notifyListeners();
  }

  void removeTask(Task id) async {
    int x = id.iD;
    await dbHelper.delete(x);
    tasks.remove(id);
    notifyListeners();
  }
}
