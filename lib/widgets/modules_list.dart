import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:review_app/models/module.dart';
import 'package:review_app/widgets/module_item.dart';

class ModulesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(documentNode: gql(r'''
        query ModulesList {
          listModules(filter: {
            categoryId: "Q2F0ZWdvcnk6MQ=="
          }) {
            id
            name
            description
            order
          }
        }
      ''')),
      builder: (
        QueryResult result, {
        Refetch refetch,
        FetchMore fetchMore,
      }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading && result.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            final module = Module(
                id: result.data['listModules'][index]['id'],
                name: result.data['listModules'][index]['name'],
                description: result.data['listModules'][index]['description'],
                order: result.data['listModules'][index]['order']);
            return ModuleItem(module, 100);
          },
          itemCount: result.data['listModules'].length,
        );
      },
    );
  }
}
