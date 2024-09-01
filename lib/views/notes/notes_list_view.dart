import 'package:flutter/material.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/utilities/dialog/delete_dialog.dart';
import 'dart:developer';

typedef NoteCallback = void Function(CloudNote note);

class NotesListView extends StatelessWidget {
  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;

  const NotesListView({
    super.key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    log("errrrrrrrrrror 1 clr");
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        log("errrrrrrrrrror 2 clr");
        final note = notes.elementAt(index);
        log("errrrrrrrrrror 3 clr");
        return ListTile(
          onTap: () {
            onTap(note);
            log("errrrrrrrrrror 4 clr $note");
          },
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              log("errrrrrrrrrror 5 clr");
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
