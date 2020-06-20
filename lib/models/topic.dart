import 'package:flutter/material.dart';

class Topic {
  final String id;
  final String name;
  final String description;
  final String content;
  final int order;

  Topic({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.content,
    @required this.order,
  });
}
