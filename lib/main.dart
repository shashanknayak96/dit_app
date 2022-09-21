import 'dart:io';

import 'package:DIT/model/task.dart';
import 'package:DIT/pages/homepage.dart';
import 'package:DIT/utils/routes.dart';
import 'package:DIT/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:store_keeper/store_keeper.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'core/task_store.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskListAdapter());
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox('ditBox');

  runApp(StoreKeeper(
    store: TaskStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp(
      title: 'DIT',
      theme: CustomTheme.darkTheme,
      routes: {
        DITRoutes.homepage: (context) => const HomePage(),
      },
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
