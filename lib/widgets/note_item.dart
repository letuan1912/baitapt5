import 'package:flutter/material.dart';
import '../models/note.dart';
import '../screens/edit_note_screen.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditNoteScreen(note: note),
            ),
          );
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => context.read<NoteProvider>().remove(note.id),
        ),
      ),
    );
  }
}
