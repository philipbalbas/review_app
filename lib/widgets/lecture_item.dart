import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LectureItem extends StatelessWidget {
  final String title;
  final int progress;

  LectureItem(this.title, this.progress);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: progress == 100 ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
                  width: 160,
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
