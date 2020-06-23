import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoList/taskData.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str;
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Add Task",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (value) {
              str = value;
            },
            autofocus: true,
            cursorColor: Colors.blueAccent,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          FlatButton(
            color: Colors.blueAccent,
            onPressed: () {
              Provider.of<TaskData>(context,listen: false).addtask(str);
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Add",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }
}
