import 'package:flutter/material.dart';

class Module {
  final String id;
  final String name;
  final String description;
  final int order;

  Module(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.order});
}
