import 'package:app_note_local/src/helper/size_gap.dart';
import 'package:app_note_local/src/utils/app_textstyles.dart';
import 'package:app_note_local/src/widget/app_textform.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatelessWidget {
  static const String routeName = "edit_task_screen";
  EditTaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Task",
          style: AppTextStyle.textStyle28,
        ),
        actions: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withAlpha(30),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            vertical(20),
            AppTextForm(
              myValidator: (text) {},
              label: "Title",
              controller: titleController,
              maxLines: 1,
            ),
            vertical(20),
            AppTextForm(
              myValidator: (text) {},
              label: "Description",
              controller: descriptionController,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
