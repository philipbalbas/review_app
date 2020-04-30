import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    Key key,
    @required this.entries,
    @required this.progress,
    this.index,
  }) : super(key: key);

  final List<String> entries;
  final List<double> progress;
  final int index;

  bool get isComplete {
    return progress[index] == 100;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isComplete ? Theme.of(context).primaryColor : Colors.white,
      margin: EdgeInsets.only(bottom: 15),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        onTap: () {},
        title: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            entries[index],
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
              isComplete ? 'Completed' : 'Progress: ${progress[index]}%',
              textAlign: TextAlign.left,
              style: TextStyle(
                color:
                    isComplete ? Colors.white : Theme.of(context).accentColor,
              ),
            ),
            LinearPercentIndicator(
              padding: EdgeInsets.only(top: 10),
              alignment: MainAxisAlignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              lineHeight: 8.0,
              percent: progress[index] / 100,
              progressColor: isComplete ? Colors.white : Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
