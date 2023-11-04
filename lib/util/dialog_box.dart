// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

class DialogBox extends StatelessWidget {
  final TEC;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.TEC,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffFFF0CE),
      content: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Add Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextField(
              controller: TEC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Add a new Task"),
            ),
            //button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                Button(text: "Save", onPressed: onSave),
                //cancel
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Button(text: "Cancel", onPressed: onCancel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
