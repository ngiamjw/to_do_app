// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDo extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  ToDo(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: onDelete, icon: Icons.delete)
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.purple[50], // Light purple background
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.purple[300]!), // Purple border
            boxShadow: [
              BoxShadow(
                color: Colors.purple[100]!.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.purple, // Purple color when checked
              checkColor: Colors.white, // Color of the check icon
            ),
            Expanded(
              // Makes text flexible in occupying remaining space
              child: Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Colors.purple[800], // Dark purple text color
                  fontSize: 16, // Adjust font size as needed
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
