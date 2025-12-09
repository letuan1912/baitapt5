import 'package:flutter/material.dart';

class Note {
  final String id;
  String title;
  String content;
  Color color;
  DateTime createdAt;
  DateTime updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });
}
