import 'package:hive_ce_flutter/hive_ce_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String note;
  @HiveField(1)
  final String date;

  NoteModel({required this.note, required this.date});
}
