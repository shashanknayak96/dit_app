import 'package:collection/collection.dart';
import 'package:store_keeper/store_keeper.dart';
import 'package:uuid/uuid.dart';

import '../core/task_store.dart';

class Task {
  String id;
  final String value;
  bool isChecked;
  final DateTime addedOn;

  Task(
    this.id,
    this.value,
    this.isChecked,
    this.addedOn,
  );
}

class TaskList {
  final List<Task> _tasks = [];

  get tasks => _tasks.toList();

  Task? getById(String id) {
    return _tasks.firstWhereOrNull((x) => x.id == id);
  }

  int getCount() {
    return _tasks.length;
  }
}

class AddTask extends Mutation<TaskStore> {
  String task;

  AddTask(this.task);

  @override
  exec() {
    store.taskList._tasks
        .add(Task(const Uuid().v1(), task, false, DateTime.now()));
  }
}

class RemoveTask extends Mutation<TaskStore> {
  String id;
  RemoveTask(this.id);
  @override
  exec() {
    store.taskList._tasks.removeWhere((x) => x.id == id);
  }
}

class SortTasks extends Mutation<TaskStore> {
  @override
  exec() {
    store.taskList._tasks.sort((a, b) => -a.addedOn.compareTo(b.addedOn));
    store.taskList._tasks.sort((a, b) => b.isChecked ? -1 : 1);
  }
}

class ToggleCheckbox extends Mutation<TaskStore> {
  String id;

  ToggleCheckbox(this.id);

  @override
  exec() {
    var tasks = store.taskList._tasks;
    var task = tasks.firstWhereOrNull((x) => x.id == id);
    var taskIndex = tasks.indexWhere((x) => x.id == task?.id);
    tasks[taskIndex].isChecked = !tasks[taskIndex].isChecked;
  }
}
