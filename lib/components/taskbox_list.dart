import 'dart:async';

import 'package:DIT/components/confirm_alert_dialog.dart';
import 'package:DIT/components/taskbox.dart';
import 'package:flutter/material.dart';
import 'package:store_keeper/store_keeper.dart';
import 'package:uuid/uuid.dart';

import '../core/task_store.dart';
import '../model/task.dart';
import '../utils/time_helper.dart';

class TaskBoxList extends StatefulWidget {
  const TaskBoxList({super.key});

  @override
  State<StatefulWidget> createState() => _TaskBoxListState();
}

class _TaskBoxListState extends State<TaskBoxList> {
  final taskStore = (StoreKeeper.store as TaskStore).taskList;

  @override
  void initState() {
    super.initState();
  }

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
    var currentTime = DateTime.now();
    var tasks = taskStore.tasks;
    bool isTimeBeforeMidnight = false;

    DateTime midnightTime;

    for (var x in tasks) {
      if (!x.isChecked) continue;

      midnightTime = TimeHelper.getMidnightTime(x.checkedOn ?? x.addedOn);
      isTimeBeforeMidnight = midnightTime.isBefore(currentTime);

      if (isTimeBeforeMidnight && x.isChecked) {
        RemoveTask(x.id);
      }
    }
  }

  // Future<void> loadTasks() async {
  //   tasks = await taskStore.tasks;
  // }
}
