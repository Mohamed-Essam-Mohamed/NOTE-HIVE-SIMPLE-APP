import 'package:app_note_local/src/model/model_note.dart';

abstract class HomeViewModelState {}

class HomeViewModelLoading extends HomeViewModelState {}

class HomeViewModelSuccess extends HomeViewModelState {
  final List<ModelNotes> listNotes;

  HomeViewModelSuccess(this.listNotes);
}

class HomeViewModelError extends HomeViewModelState {
  final String messageError;

  HomeViewModelError(this.messageError);
}
