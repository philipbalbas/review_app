import 'package:flutter/material.dart';

import '../models/subject.dart';
import '../widgets/topics_list.dart';

class TopicsListScreen extends StatelessWidget {
  static String routeName = '/topics-list';

  final Subject subject;

  final List<String> topics = [
    'Kinetics and Chemical Equilibrium',
    'Group Properties of Elements',
    'Pharmaceutical Aids and Necessities',
    'Major Intra- and Extracellular Electrolytes',
  ];

  final List<double> progress = [100, 50, 20, 34];

  TopicsListScreen(this.subject);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    subject.name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    subject.description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              ],
            ),
            Expanded(child: TopicsList(subject: subject))
          ],
        ),
      ),
    );
  }
}
