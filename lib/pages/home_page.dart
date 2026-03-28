import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/cubits/note_cubit/notes_states.dart';
import 'package:notes_app/widgets/custom_add_dialoge.dart';
import 'package:notes_app/widgets/goal_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NotesState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: mainColor,
            title: Text(
              'GOALS',
              style: TextStyle(fontSize: 34, color: Colors.white),
            ),
          ),
          floatingActionButtonLocation: state.notes.isEmpty
              ? FloatingActionButtonLocation.centerFloat
              : FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 42, 125, 167),
            shape: CircleBorder(),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomAddDialoge(),
              );
            },
            child: Icon(Icons.add, size: 30, color: Colors.white),
          ),
          body: state.notes.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notes_rounded,
                        size: 100,
                        color: Colors.blue.withAlpha(125),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "مفيش أهداف دلوقتي.. ضيف هدف جديد",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: NoteCubit.get(context).scrollController,
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) =>
                      GoalTile(index: index + 1, text: state.notes[index].note),
                ),
        );
      },
    );
  }
}
