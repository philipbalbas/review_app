import 'package:flutter/material.dart';

import '../widgets/subject_item.dart';

class SubjectsListScreen extends StatelessWidget {
  static String routeName = '/subjects-list';

  final List<String> entries = [
    'Inorganic Chemistry',
    'Organic Chemistry',
    'Qualitative Chemistry'
  ];

  final List<double> progress = [100, 50, 20];

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
              padding: EdgeInsets.only(bottom: 25),
              child: Text(
                'Pharmaceutical Chemistry',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (ctx, i) {
                  return SubjectItem(
                    entries: entries,
                    progress: progress,
                    index: i,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
