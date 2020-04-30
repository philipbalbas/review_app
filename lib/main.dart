import 'package:flutter/material.dart';
import 'package:review_app/screens/subjects_list_screen.dart';

import 'screens/modules_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo[400],
      ),
      home: ModuleListScreen(),
      routes: {
        SubjectsListScreen.routeName: (ctx) => SubjectsListScreen(),
      },
    );
  }
}
