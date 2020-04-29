import 'package:flutter/material.dart';

import '../widgets/lecture_item.dart';

class ModuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            LectureItem('Pharmaceutical Chemistry', 100),
            LectureItem('Pharmacognosy', 20),
            LectureItem('Practice of Pharmacy', 35),
            LectureItem('Pharmacology/Pharmacokinetics', 25),
            LectureItem('Pharmaceutics', 0),
            LectureItem('Quality Assurance / Quality Control', 0),
          ],
        ),
      ),
    );
    ;
  }
}
