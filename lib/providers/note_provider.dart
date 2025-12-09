import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/note_service.dart';

class NoteProvider extends ChangeNotifier {
  final NoteService _service = NoteService();

  List<Note> _notes = [];
  String _search = "";

  List<Note> get notes {
    if (_search.isEmpty) return _notes;
    return _notes
        .where((n) =>
    n.title.toLowerCase().contains(_search.toLowerCase()) ||
        n.content.toLowerCase().contains(_search.toLowerCase()))
        .toList();
  }

  NoteProvider() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    _notes = await _service.getNotes();
    notifyListeners();
  }

  void setSearch(String value) {
    _search = value;
    notifyListeners();
  }

  Future<void> addNote(String title, String content, Color color) async {
    await _service.addNote(title, content, color);
    await loadNotes();
  }

  Future<void> updateNote(String id, String title, String content, Color color) async {
    await _service.updateNote(id, title, content, color);
    await loadNotes();
  }

  Future<void> remove(String id) async {
    await _service.removeNote(id);
    await loadNotes();
  }
}
