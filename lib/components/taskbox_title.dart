import 'package:flutter/material.dart';

class TaskBoxTitle extends StatelessWidget {
  final myTasksText = "My tasks for the day are, ";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 8.0,
        right: 8.0,
        bottom: 8.0,
      ),
      child: Text(
        myTasksText,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
