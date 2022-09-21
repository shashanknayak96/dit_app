import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:store_keeper/store_keeper.dart';

import '../components/confirm_alert_dialog.dart';
import '../components/create_task.dart';
import '../components/midnight_timer.dart';
import '../components/taskbox_list.dart';
import '../components/taskbox_title.dart';
import '../core/task_store.dart';
import '../model/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskStore = (StoreKeeper.store as TaskStore).taskList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MidnightTimer(),
            TaskBoxTitle(),
            const TaskBoxList(),
            const CreateTask(),
          ],
        ),
      ),
    );
  }

  Future<void> loadData() async {
    // var hivebox = Hive.openBox('ditBox');
    var box = Hive.box('ditBox');
    var taskString = box.get("tasks")?.cast<Task>() ?? [];

    if (taskString != null) {
      taskStore.tasks = taskString;
    }
  }
}
