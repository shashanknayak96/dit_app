import 'package:dit_app/components/create_task.dart';
import 'package:dit_app/components/taskbox_list.dart';
import 'package:dit_app/components/taskbox_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../components/menu_bar.dart';
import '../components/taskbox.dart';

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
            TaskBoxTitle(),
            const TaskBoxList(),
            // CreateTask(),
          ],
        ),
      ),
      bottomNavigationBar: CreateTask(),
    );
  }
}
