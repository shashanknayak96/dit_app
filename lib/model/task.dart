import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:localstorage/localstorage.dart';
import 'package:store_keeper/store_keeper.dart';
import 'package:uuid/uuid.dart';

import '../core/task_store.dart';

part 'task.g.dart';
// part 'tasklist.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String id;

  @HiveField(1)
  final String value;

  @HiveField(2)
  bool isChecked;

  @HiveField(3)
  final DateTime addedOn;

  @HiveField(4)
  DateTime? checkedOn;

  Task(this.id, this.value, this.isChecked, this.addedOn, this.checkedOn);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'],
        isChecked = json['isChecked'],
        addedOn = json['addedOn'],
        checkedOn = json['checkedOn'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'isChecked': isChecked.toString(),
      'addedOn': addedOn.toString(),
      'checkedOn': checkedOn.toString()
    };
  }
}

@HiveType(typeId: 1)
class TaskList {
  @HiveField(0)
  List<Task> _tasks = [];
  TaskList();

  TaskList.fromMap(Map<String, dynamic> data) {
    _tasks = data['tasks'].cast<List<Task>>();
  }

  TaskList.fromJson(Map<String, dynamic> json) : _tasks = json['tasks'];
  Map<String, List<Task>> toJson() {
    return {'tasks': _tasks};
  }

  get tasks {
    return _tasks.toList();
  }

  set tasks(value) {
    _tasks = value;
  }

  Task? getById(String id) {
    return _tasks.firstWhereOrNull((x) => x.id == id);
  }

  int getCount() {
    return _tasks.length;
  }
}

class AddTask extends Mutation<TaskStore> {
  String taskValue;

  AddTask(this.taskValue);

  final LocalStorage storage = LocalStorage('dit');

  @override
  exec() async {
    var newTask = Task(
      const Uuid().v1(),
      taskValue,
      false,
      DateTime.now(),
      null,
    );
    store.taskList._tasks.add(newTask);

    var taskJsonString = jsonEncode(store.taskList._tasks);
    storage.setItem("tasks", taskJsonString);

    var box = Hive.box('ditBox');
    await box.put("tasks", store.taskList._tasks);
  }
}

class RemoveTask extends Mutation<TaskStore> {
  String id;
  RemoveTask(this.id);
  @override
  exec() async {
    store.taskList._tasks.removeWhere((x) => x.id == id);

    var box = Hive.box('ditBox');
    await box.put("tasks", store.taskList._tasks);
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
    tasks[taskIndex].checkedOn = DateTime.now();
  }
}
