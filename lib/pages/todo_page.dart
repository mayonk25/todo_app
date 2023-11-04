// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //init state
  @override
  void initState() {
    if (_thebox.get("TASKLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // vars
  final _thebox = Hive.box('thebox');
  final _TEC = TextEditingController();
  TaskDatabase db = TaskDatabase();

  // methods

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.TaskList[index][1] = !db.TaskList[index][1];
    });
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          TEC: _TEC,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveTask() {
    setState(() {
      db.TaskList.add([_TEC.text, false]);
      _TEC.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void _deleteTask(int index) {
    setState(() {
      db.TaskList.removeAt(index);
    });
    db.updateDatabase();

  }

  //UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF0CE),
      appBar: AppBar(
        leading: Icon(Icons.assignment),
        backgroundColor: Color(0xff0C356A),
        title: Text("Simple To-Do App"),
        centerTitle: false,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Color(0xffFFC436),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.TaskList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.TaskList[index][0],
            taskCompleted: db.TaskList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => _deleteTask(index),
          );
        },
      ),
    );
  }
}
