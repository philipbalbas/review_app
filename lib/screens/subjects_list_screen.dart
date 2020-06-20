import 'package:flutter/material.dart';
import 'package:review_app/widgets/subjects_list.dart';

import '../models/module.dart';
import '../widgets/subject_item.dart';

class SubjectsListScreen extends StatelessWidget {
  final Module module;

  final List<String> entries = [
    'Inorganic Chemistry',
    'Organic Chemistry',
    'Qualitative Chemistry'
  ];

  final List<double> progress = [100, 50, 20];

  SubjectsListScreen(this.module);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                module.description,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: SubjectsList(module: module))
          ],
        ),
      ),
    );
  }
}
