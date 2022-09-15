import 'package:flutter/material.dart';

import '../model/task.dart';
import '../utils/globals.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  var taskValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 60,
      child: Row(
        children: [
          Expanded(child: _buildTextField()),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: taskValue,
        style: TextStyle(color: Globals.white),
        cursorColor: Globals.white,
        decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColor,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(10.0),
            hintText: "Enter a task you want to complete...",
            hintStyle: Theme.of(context).textTheme.headline5,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Globals.lightPurple,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Globals.lightPurple,
            ))),
      ),
    );
  }

  Widget _buildAddButton() {
    var now = DateTime.now();
    var noon = DateTime(now.year, now.month, now.day).add(Duration(days: 1));

    return ElevatedButton(
      onPressed: () {
        if (taskValue.text.isEmpty) return;
        AddTask(taskValue.text);
        taskValue.text = "";
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        // padding: EdgeInsets.all(16),
      ),
      child: Icon(
        Icons.add,
        color: Globals.lightPink,
      ),
    );
  }
}
