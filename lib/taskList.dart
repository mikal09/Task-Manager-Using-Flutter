import 'package:flutter/material.dart';
import 'package:todoList/taskData.dart';
import 'package:todoList/taskTile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: (val) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: () {
                taskData.removeTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
