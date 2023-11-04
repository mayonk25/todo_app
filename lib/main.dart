// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  //hive init
  await Hive.initFlutter();
  var box = await Hive.openBox("thebox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}
