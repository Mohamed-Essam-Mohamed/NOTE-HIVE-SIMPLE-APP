import 'package:app_note_local/src/feature/home/view/widget/note_item.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const NoteItem();
      },
    );
  }
}
