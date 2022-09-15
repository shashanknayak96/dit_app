import 'package:DIT/pages/homepage.dart';
import 'package:DIT/utils/routes.dart';
import 'package:DIT/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_keeper/store_keeper.dart';

import 'core/task_store.dart';

void main() {
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
