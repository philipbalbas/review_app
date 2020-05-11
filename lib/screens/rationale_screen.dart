import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class RationaleScreen extends StatelessWidget {
  static String routeName = '/rationale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rationale'),
      ),
      body: Center(
        child: Text('Rationale Screen'),
      ),
    );
  }
}
