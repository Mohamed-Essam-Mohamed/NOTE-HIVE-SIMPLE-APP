import 'package:app_note_local/src/model/model_note.dart';
import 'package:app_note_local/src/feature/home/view/home_screen.dart';
import 'package:app_note_local/src/helper/size_gap.dart';
import 'package:app_note_local/src/utils/app_textstyles.dart';
import 'package:app_note_local/src/widget/app_textform.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = "edit_task_screen";
  EditTaskScreen({
    super.key,
  });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ModelNotes;
    titleController.text = args.title;
    descriptionController.text = args.description;
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
              onPressed: () {
                args.title = titleController.text ?? args.title;
                args.description =
                    descriptionController.text ?? args.description;
                args.save();
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
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
              myValidator: (text) {
                return null;
              },
              label: "Title",
              controller: titleController,
              maxLines: 1,
            ),
            vertical(20),
            AppTextForm(
              myValidator: (text) {
                return null;
              },
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
