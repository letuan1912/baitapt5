import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteService {
  final List<Note> _storage = [];

  Future<List<Note>> getNotes() async {
    return _storage;
  }

  Future<void> addNote(String title, String content, Color color) async {
    _storage.add(
      Note(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        content: content,
        color: color,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  Future<void> updateNote(String id, String title, String content, Color color) async {
    final index = _storage.indexWhere((n) => n.id == id);
    if (index == -1) return;

    _storage[index].title = title;
    _storage[index].content = content;
    _storage[index].color = color;
    _storage[index].updatedAt = DateTime.now();
  }

  Future<void> removeNote(String id) async {
    _storage.removeWhere((note) => note.id == id);
  }
}
