import 'package:app_note_local/src/feature/edit_task/view/edittask_screen.dart';
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
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, EditTaskScreen.routeName);
          },
          child: const NoteItem(),
        );
      },
    );
  }
}
