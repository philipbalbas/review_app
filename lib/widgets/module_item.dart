import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/module.dart';
import '../screens/subjects_list_screen.dart';

class ModuleItem extends StatelessWidget {
  final Module module;
  final int progress;

  ModuleItem(this.module, this.progress);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => SubjectsListScreen(module)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              module.name,
              style: TextStyle(
                color: progress == 100 ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              module.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: <Widget>[
                Text(
                  progress == 100 ? 'Completed' : 'Progress: $progress%',
                  style: TextStyle(
                    color: progress == 100 ? Colors.white : Colors.black,
                  ),
                ),
                LinearPercentIndicator(
                  padding: EdgeInsets.only(top: 10),
                  alignment: MainAxisAlignment.center,
                  width: 140,
                  lineHeight: 8.0,
                  percent: progress / 100,
                  progressColor: progress == 100 ? Colors.white : Colors.indigo,
                )
              ],
            )
          ],
        ),
      ),
      color:
          progress == 100 ? Theme.of(context).primaryColor : Colors.grey[100],
    );
  }
}
