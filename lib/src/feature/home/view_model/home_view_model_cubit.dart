import 'package:app_note_local/src/feature/home/view_model/home_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelLoading());
}
