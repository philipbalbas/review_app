import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:review_app/screens/rationale_screen.dart';

class ResultScreen extends StatelessWidget {
  static String routeName = '/result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Kinetics and Chemical Equilibrium",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                )),
            Column(
              children: <Widget>[
                CircularPercentIndicator(
                  center: Text(
                    "78%",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  radius: 200.0,
                  lineWidth: 15.0,
                  percent: 0.8,
                  footer: Text('Keep Studying'),
                  backgroundColor: Colors.grey,
                  progressColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Retake'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RationaleScreen.routeName);
                  },
                  child: Text('Explanation'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Next'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
