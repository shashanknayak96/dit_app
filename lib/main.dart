import 'package:dit_app/pages/homepage.dart';
import 'package:dit_app/utils/routes.dart';
import 'package:dit_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp(
      title: 'DIT',
      theme: CustomTheme.darkTheme,
      routes: {DITRoutes.homepage: (context) => const HomePage()},
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
