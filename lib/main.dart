import 'src/constant/app_const_hive.dart';
import 'src/model/model_note.dart';
import 'src/feature/edit_task/view/edittask_screen.dart';
import 'src/feature/home/view/home_screen.dart';
import 'src/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelNotesAdapter());

  await Hive.openBox<ModelNotes>(openBox);
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        EditTaskScreen.routeName: (context) => EditTaskScreen(),
      },
    );
  }
}
