import '../../../edit_task/view/edittask_screen.dart';
import 'note_item.dart';
import '../../view_model/home_view_model_cubit.dart';
import '../../view_model/home_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  HomeViewModelCubit viewModel = HomeViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
      bloc: viewModel..getAllNotes(),
      builder: (context, state) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: viewModel.notesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, EditTaskScreen.routeName,
                    arguments: viewModel.notesList[index]);
              },
              child: NoteItem(
                onPressedDelete: () {
                  viewModel.notesList[index].delete();
                  viewModel.getAllNotes();
                },
                notes: viewModel.notesList[index],
              ),
            );
          },
        );
      },
    );
  }
}
