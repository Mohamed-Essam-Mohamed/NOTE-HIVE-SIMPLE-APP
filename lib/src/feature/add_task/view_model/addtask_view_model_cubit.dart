import 'package:app_note_local/src/constant/app_const_hive.dart';
import 'package:app_note_local/src/model/model_note.dart';
import 'package:app_note_local/src/feature/add_task/view_model/addtask_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AddTaskViewModelCubit extends Cubit<AddTaskViewModelState> {
  AddTaskViewModelCubit() : super(AddTaskViewModelLoading());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime dateTime = DateTime.now();
  var formKey = GlobalKey<FormState>();
  Color currentColor = Color(0xff007F73);
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  addTask() async {
    if (formKey.currentState!.validate()) {
      emit(AddTaskViewModelLoading());
      var note = ModelNotes(
        title: titleController.text,
        description: descriptionController.text,
        date: dateTime.toString(),
        color: currentColor.value,
      );
      try {
        var notsBox = Hive.box<ModelNotes>(openBox);
        await notsBox.add(note);
        emit(AddTaskViewModelSuccess());
      } catch (e) {
        emit(AddTaskViewModelError(e.toString()));
      }
    }
  }
}
