import 'package:flutter/material.dart';

class Subject {
  final String id;
  final String name;
  final String description;
  final int order;

  Subject({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.order,
  });
}
