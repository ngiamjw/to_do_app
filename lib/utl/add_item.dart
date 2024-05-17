// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/utl/buttons.dart';

class AddItem extends StatelessWidget {
  TextEditingController mycontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddItem(
      {super.key,
      required this.mycontroller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          Colors.purple[50], // Light purple background for the dialog
      content: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                hintText: "To Do",
                hintStyle: TextStyle(
                    color: Colors.purple[300]), // Light purple hint text
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.purple,
                      width: 2.0), // Purple border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.purple,
                      width: 2.0), // Darker purple border when focused
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Adds space between the text field and the row of buttons
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Better spacing between buttons
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave, // White text for better readability
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel, // White text for better readability
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
