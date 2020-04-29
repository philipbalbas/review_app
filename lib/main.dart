import 'package:flutter/material.dart';

import 'screens/modules_screen.dart';

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
      home: ModuleScreen(),
    );
  }
}
