import 'package:flutter/material.dart';
import 'package:todoList/taskData.dart';
import 'homeScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
