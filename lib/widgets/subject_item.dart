import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:review_app/models/subject.dart';
import 'package:review_app/screens/topics_list_screen.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    Key key,
    @required this.subject,
    @required this.progress,
  }) : super(key: key);

  final Subject subject;
  final int progress;

  bool get isComplete {
    return progress == 100;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isComplete ? Theme.of(context).primaryColor : Colors.white,
      margin: EdgeInsets.only(bottom: 15),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => TopicsListScreen(subject)));
        },
        title: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            subject.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isComplete ? Colors.white : Theme.of(context).accentColor,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              isComplete ? 'Completed' : 'Progress: $progress%',
              textAlign: TextAlign.left,
              style: TextStyle(
                color:
                    isComplete ? Colors.white : Theme.of(context).accentColor,
              ),
            ),
            LinearPercentIndicator(
              padding: EdgeInsets.only(top: 10),
              alignment: MainAxisAlignment.center,
              lineHeight: 8.0,
              percent: progress / 100,
              progressColor: isComplete ? Colors.white : Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
