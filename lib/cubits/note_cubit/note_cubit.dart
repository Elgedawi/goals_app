import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/note_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NoteCubit extends Cubit<NotesState> {
  NoteCubit() : super(NotesState([])) {
    fetchAllNotes();
  }
  ScrollController scrollController = ScrollController();
  TextEditingController textcontroller = TextEditingController();
  @override
  Future<void> close() {
    scrollController.dispose();
    textcontroller.dispose();
    return super.close();
  }

  Box<NoteModel> notesBox = Hive.box<NoteModel>('notesBox');

  static NoteCubit get(BuildContext context) =>
      BlocProvider.of<NoteCubit>(context);

  void fetchAllNotes() {
    emit(NotesState(notesBox.values.toList()));
  }

  void addNote(NoteModel note) async {
    await notesBox.add(note);
    emit(NotesState(notesBox.values.toList()));
  }

  void updateNote(int index, NoteModel note) async {
    await notesBox.putAt(index, note);
    emit(NotesState(notesBox.values.toList()));
  }

  void deleteNote(int index) async {
    await notesBox.deleteAt(index);
    emit(NotesState((notesBox.values.toList())));
  }
}
