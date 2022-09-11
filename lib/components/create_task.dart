import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Theme.of(context).primaryColor,
                    border: const OutlineInputBorder(),
                    hintText: "Enter a task"),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              // padding: EdgeInsets.all(16),
            ),
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
