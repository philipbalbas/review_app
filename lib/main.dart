import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:review_app/client.dart';
import 'package:review_app/screens/result_screen.dart';

import 'screens/modules_list_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/rationale_screen.dart';
import 'screens/subjects_list_screen.dart';
import 'screens/topics_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Config.client,
      child: MaterialApp(
        title: 'Review App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo[400],
        ),
        home: ModuleListScreen(),
        routes: {
          QuizScreen.routeName: (ctx) => QuizScreen(),
          ResultScreen.routeName: (ctx) => ResultScreen(),
          RationaleScreen.routeName: (ctx) => RationaleScreen(),
        },
      ),
    );
  }
}
