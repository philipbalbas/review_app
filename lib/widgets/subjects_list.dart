import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:review_app/models/module.dart';
import 'package:review_app/models/subject.dart';
import 'package:review_app/widgets/subject_item.dart';

class SubjectsList extends StatelessWidget {
  final Module module;

  const SubjectsList({Key key, this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(r'''
            query SubjectsList($moduleId: ID!) {
              listSubjects(filter: {
                moduleId: $moduleId
              }) {
                id
                name
                description
                order
              }
            }
          '''),
        variables: {"moduleId": module.id},
      ),
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
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final subject = Subject(
              id: result.data['listSubjects'][index]['id'],
              name: result.data['listSubjects'][index]['name'],
              description: result.data['listSubjects'][index]['description'],
              order: result.data['listSubjects'][index]['order'],
            );
            return SubjectItem(subject: subject, progress: 100);
          },
          itemCount: result.data['listSubjects'].length,
        );
      },
    );
  }
}
