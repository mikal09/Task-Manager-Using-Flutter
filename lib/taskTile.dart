import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
