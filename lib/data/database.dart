// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';

class TaskDatabase {
  List TaskList = [];

  final _thebox = Hive.box('thebox');

  //first run
  void createInitialData() {
    TaskList = [
      ["Example Task 1", false],
      ["Example Task 2", true],
    ];
  }

  //load data
  void loadData() {
    TaskList = _thebox.get("TASKLIST");
  }

  void updateDatabase() {
    _thebox.put("TASKLIST", TaskList);
    print("databases updated");
    List temp = _thebox.get("TASKLIST");
    print(temp);
  }
}
