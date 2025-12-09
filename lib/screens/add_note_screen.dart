import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final titleCtrl = TextEditingController();
  final contentCtrl = TextEditingController();
  Color selectedColor = Colors.yellow;

  final List<Color> colors = [
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NoteProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                await provider.addNote(
                  titleCtrl.text,
                  contentCtrl.text,
                  selectedColor,
                );
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
