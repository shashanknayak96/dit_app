import 'dart:async';

import 'package:DIT/components/confirm_alert_dialog.dart';
import 'package:DIT/components/taskbox.dart';
import 'package:flutter/material.dart';
import 'package:store_keeper/store_keeper.dart';
import 'package:uuid/uuid.dart';

import '../core/task_store.dart';
import '../model/task.dart';

class TaskBoxList extends StatefulWidget {
  const TaskBoxList({super.key});

  @override
  State<StatefulWidget> createState() => _TaskBoxListState();
}

class _TaskBoxListState extends State<TaskBoxList> {
  var taskList = [
    Task(const Uuid().v1(), "My task 1", false, DateTime.now()),
  ];
  final taskStore = (StoreKeeper.store as TaskStore).taskList;

  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context, to: [AddTask, SortTasks, ToggleCheckbox]);
    SortTasks();

    Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => removeCheckedTasks(),
    );

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: taskStore.tasks
                .map<Widget>(
                  (task) => Dismissible(
                    key: Key(task.id),
                    onDismissed: (direction) => {RemoveTask(task.id)},
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ConfirmAlertDialog();
                        },
                      );
                    },
                    child: TaskBox(
                      id: task.id,
                      value: task.value,
                      isChecked: task.isChecked,
                      onChanged: () => {}, //toggleCheckBox(task.id),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  removeCheckedTasks() {
    var timeNow = DateTime.now();
    var timeToMidnight = DateTime(timeNow.year, timeNow.month, timeNow.day)
        .add(const Duration(days: 1));
    var tasks = taskStore.tasks as List<Task>;
    bool isTimeBeforeMidnight = false;

    // tasks.forEach((x) => {
    //       isTimeBeforeMidnight =
    //           x.addedOn.difference(timeToMidnight).isNegative ? false : true,
    //       // print(timeToMidnight.difference(other)),
    //       if (isTimeBeforeMidnight && x.isChecked)
    //         {RemoveTask(x.id), print("REMOVING")}
    //     });
  }
}
