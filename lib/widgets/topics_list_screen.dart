import 'package:flutter/material.dart';

class TopicsListScreen extends StatelessWidget {
  static String routeName = '/topics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: Center(
        child: Text('Topics Screen'),
      ),
    );
  }
}
