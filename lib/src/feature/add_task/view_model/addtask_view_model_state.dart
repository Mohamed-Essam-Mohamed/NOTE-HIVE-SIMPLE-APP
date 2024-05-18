abstract class AddTaskViewModelState {}

class AddTaskViewModelLoading extends AddTaskViewModelState {}

class AddTaskViewModelSuccess extends AddTaskViewModelState {}

class AddTaskViewModelError extends AddTaskViewModelState {
  String errorMessage;

  AddTaskViewModelError(this.errorMessage);
}
