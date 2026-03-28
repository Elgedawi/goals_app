import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';

class CustomEditDialoge extends StatelessWidget {
  const CustomEditDialoge({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    NoteCubit.get(context).textcontroller.clear();
    return AlertDialog(
      shape: BoxBorder.all(),
      content: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Container(
              color: mainColor,
              height: 40,
              width: 250,
              child: Center(
                child: Text(
                  'Editting.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: NoteCubit.get(context).textcontroller,
                decoration: InputDecoration(
                  hint: Text(
                    'Write Here.....',
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    name: 'Edit',
                    color: const Color.fromARGB(255, 26, 107, 100),
                    size: Size(110, 40),
                    onPressed: () {
                      NoteCubit.get(context).updateNote(
                        index,
                        NoteModel(
                          note: NoteCubit.get(context).textcontroller.text,
                          date: '',
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    name: 'Remove',
                    color: Colors.lightBlueAccent,
                    size: Size(110, 40),
                    onPressed: () {
                      NoteCubit.get(context).deleteNote(index);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            CustomButton(
              name: 'Cancel',
              color: Colors.lightGreen,
              size: Size(230, 40),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
