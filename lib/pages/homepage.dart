import 'package:flutter/material.dart';

import '../components/create_task.dart';
import '../components/midnight_timer.dart';
import '../components/taskbox_list.dart';
import '../components/taskbox_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
}
