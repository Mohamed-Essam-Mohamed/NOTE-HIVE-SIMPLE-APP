import 'package:app_note_local/src/feature/add_task/view_model/addtask_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskViewModelCubit extends Cubit<AddTaskViewModelState> {
  AddTaskViewModelCubit() : super(AddTaskViewModelLoading());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
}
