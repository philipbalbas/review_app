import 'package:flutter/material.dart';

import '../widgets/module_item.dart';

class ModuleListScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  _ModuleListScreenState createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            ModuleItem('Pharmaceutical Chemistry', 100),
            ModuleItem('Pharmacognosy', 20),
            ModuleItem('Practice of Pharmacy', 35),
            ModuleItem('Pharmacology/Pharmacokinetics', 25),
            ModuleItem('Pharmaceutics', 0),
            ModuleItem('Quality Assurance / Quality Control', 0),
          ],
        ),
      ),
    );
    ;
  }
}
