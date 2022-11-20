import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel{
  @HiveField(0)
  late String text;

  NoteModel({
    required this.text,
  });
}