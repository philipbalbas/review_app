import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink =
      HttpLink(uri: 'https://app.concenix.com/api');

  static final AuthLink authLink = AuthLink(getToken: () => "Bearer nada");

  static final Link link = authLink.concat(httpLink);

  static final ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(link: httpLink, cache: InMemoryCache()));
}
