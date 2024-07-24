import 'package:flutter/material.dart';
import 'package:mynotesapp/services/cloud/cloud_notes.dart';
import 'package:mynotesapp/utilities/dialogs/delete_dialog.dart';

typedef DeleteNotesCallback = void Function(CloudNotes notes);

class NotesListView extends StatelessWidget {
  final List<CloudNotes> notes;
  final DeleteNotesCallback onDeleteNote;

  const NotesListView({
    super.key,
    required this.notes,
    required this.onDeleteNote,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                onDeleteNote(note);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
