import '../../../../model/model_note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_textstyles.dart';

class NoteItem extends StatelessWidget {
  final ModelNotes notes;
  final void Function()? onPressedDelete;

  const NoteItem({
    super.key,
    required this.notes,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(notes.color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notes.title,
                style: AppTextStyle.textStyle26,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                notes.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.textStyle18,
              ),
              trailing: IconButton(
                onPressed: onPressedDelete,
                icon: Icon(
                  Icons.delete,
                  color: AppColors.colorRed,
                  size: 30,
                ),
              ),
            ),
            Text(
                DateFormat('yyyy/MM/dd – kk:mm').format(
                  DateTime.parse(notes.date),
                ),
                style: AppTextStyle.textStyle18),
          ],
        ),
      ),
    );
  }
}
