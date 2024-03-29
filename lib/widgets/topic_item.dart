import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:review_app/models/topic.dart';

import '../screens/quiz_screen.dart';

class TopicItem extends StatefulWidget {
  const TopicItem({
    Key key,
    @required this.topic,
    this.progress,
  }) : super(key: key);

  final Topic topic;
  final double progress;

  @override
  _TopicsItemState createState() => _TopicsItemState();
}

class _TopicsItemState extends State<TopicItem> {
  bool _isOpen;

  @override
  void initState() {
    _isOpen = false;
    super.initState();
  }

  void _openCard() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  bool get isComplete {
    return widget.progress == 100;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      elevation: 5,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.topic.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    isComplete ? 'Completed' : 'Progress: ${widget.progress}%'),
                LinearPercentIndicator(
                  padding: EdgeInsets.only(top: 10),
                  alignment: MainAxisAlignment.center,
                  lineHeight: 8.0,
                  percent: widget.progress / 100,
                  progressColor: Colors.indigo,
                )
              ],
            ),
            onTap: _openCard,
          ),
          // if (_isOpen)
          //   ListView.builder(
          //     shrinkWrap: true,
          //     physics: ClampingScrollPhysics(),
          //     itemCount: 1,
          //     itemBuilder: (ctx, i) => Container(
          //       decoration: BoxDecoration(
          //         border: Border(
          //           top: BorderSide(
          //             width: 1,
          //             color: Colors.purple,
          //           ),
          //         ),
          //       ),
          //       child: Container(
          //         child: ListTile(
          //           dense: true,
          //           onTap: () {
          //             Navigator.of(context).pushNamed(QuizScreen.routeName);
          //           },
          //           title: Text("topic"),
          //           trailing: Icon(Icons.play_arrow),
          //           subtitle: Text('0/12'),
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
