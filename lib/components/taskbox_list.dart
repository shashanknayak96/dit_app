import 'package:dit_app/components/taskbox.dart';
import 'package:dit_app/utils/themes.dart';
import 'package:flutter/material.dart';

class TaskBoxList extends StatefulWidget {
  const TaskBoxList({super.key});

  @override
  State<StatefulWidget> createState() => _TaskBoxListState();
}

class _TaskBoxListState extends State<TaskBoxList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                for (var a = 0; a <= 10; a++)
                  const TaskBox(
                    value: "My first task",
                    isChecked: false,
                  ),
              ],
            )),
      ),
    );
  }
}
