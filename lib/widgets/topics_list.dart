import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:review_app/widgets/topic_item.dart';

import '../models/subject.dart';
import '../models/topic.dart';
import 'subject_item.dart';

class TopicsList extends StatelessWidget {
  final Subject subject;

  const TopicsList({Key key, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(r'''
            query TopicsList($subjectId: ID!) {
              listTopics(filter: {
                subjectId: $subjectId
              }) {
                id
                name
                description
                order
              }
            }
          '''),
        variables: {"subjectId": subject.id},
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
            final topic = Topic(
              id: result.data['listTopics'][index]['id'],
              name: result.data['listTopics'][index]['name'],
              description: result.data['listTopics'][index]['description'],
              content: result.data['listTopics'][index]['content'],
              order: result.data['listTopics'][index]['order'],
            );
            return TopicItem(
              topic: topic,
              progress: 100,
            );
          },
          itemCount: result.data['listTopics'].length,
        );
      },
    );
  }
}
