import 'package:app_note_local/src/helper/size_gap.dart';
import 'package:app_note_local/src/utils/app_colors.dart';
import 'package:app_note_local/src/utils/app_textstyles.dart';
import 'package:app_note_local/src/widget/app_material_button.dart';
import 'package:app_note_local/src/widget/app_textform.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          Divider(
            color: AppColors.colorBlue,
            endIndent: 130,
            indent: 130,
            thickness: 4,
          ),
          vertical(10),
          Text(
            "ADD Task",
            style: AppTextStyle.textStyle26.copyWith(
              color: AppColors.colorBlue,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  vertical(20),
                  AppTextForm(
                    label: "Title",
                    controller: titleController,
                    maxLines: 1,
                    myValidator: (text) {},
                  ),
                  vertical(2),
                  AppTextForm(
                    label: "Description",
                    controller: descriptionController,
                    maxLines: 4,
                    myValidator: (text) {},
                  ),
                ],
              ),
            ),
          ),
          AppMaterialButton(
            onPressed: () {},
            title: "ADD",
          ),
          vertical(25),
        ],
      ),
    );
  }
}
