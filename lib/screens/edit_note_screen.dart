import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../providers/note_provider.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;

  const EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleCtrl;
  late TextEditingController contentCtrl;
  late Color selectedColor;

  final List<Color> colors = [
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.note.title);
    contentCtrl = TextEditingController(text: widget.note.content);
    selectedColor = widget.note.color;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NoteProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Note")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              children: colors.map((c) {
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = c),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: c,
                    child: selectedColor == c
                        ? const Icon(Icons.check, color: Colors.black)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: contentCtrl,
              decoration: const InputDecoration(labelText: "Content"),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () async {
                await provider.updateNote(
                  widget.note.id,
                  titleCtrl.text,
                  contentCtrl.text,
                  selectedColor,
                );
                Navigator.pop(context);
              },
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}
