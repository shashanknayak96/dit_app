import 'package:store_keeper/store_keeper.dart';

import '../model/task.dart';

class TaskStore extends Store {
  late TaskList taskList;

  TaskStore() {
    taskList = TaskList();
  }
}
