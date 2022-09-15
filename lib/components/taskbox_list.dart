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

  @override
  Widget build(BuildContext context) {
    final taskStore = (StoreKeeper.store as TaskStore).taskList;
    StoreKeeper.listen(context, to: [AddTask, SortTasks, ToggleCheckbox]);
    SortTasks();
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

  refresh() {
    setState(() {});
  }
}
