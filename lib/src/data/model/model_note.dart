import 'package:hive/hive.dart';

// part 'model_note.g.dart';
@HiveType(typeId: 0)
class ModelNotes extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  ModelNotes({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
