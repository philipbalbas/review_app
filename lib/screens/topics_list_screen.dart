import 'package:flutter/material.dart';
import 'package:review_app/widgets/topics_item.dart';

class TopicsListScreen extends StatelessWidget {
  static String routeName = '/topics-list';

  final List<String> topics = [
    'Kinetics and Chemical Equilibrium',
    'Group Properties of Elements',
    'Pharmaceutical Aids and Necessities',
    'Major Intra- and Extracellular Electrolytes',
  ];

  final List<double> progress = [100, 50, 20, 34];

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
                    'Inorganic Chemistry',
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
                    'The chemistry and pharmacy of inorganic medicinals, with emphasis on those officia; in the USP and NF, their preparations, properties, tests and uses.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (ctx, i) =>
                    TopicsItem(topic: topics[i], progress: progress[i]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
