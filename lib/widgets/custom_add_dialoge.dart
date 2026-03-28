import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';

class CustomAddDialoge extends StatelessWidget {
  const CustomAddDialoge({super.key});
  @override
  Widget build(BuildContext context) {
    NoteCubit.get(context).textcontroller.clear();
    return AlertDialog(
      shape: BoxBorder.all(),
      content: SizedBox(
        height: 150,
        width: 200,
        child: Column(
          children: [
            Container(
              color: mainColor,
              height: 40,
              width: 250,
              child: Center(
                child: Text(
                  'Write Your Gaol.',
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
                    name: 'ADD',
                    color: Colors.redAccent,
                    size: Size(100, 40),
                    onPressed: () {
                      context.read<NoteCubit>().addNote(
                        NoteModel(
                          note: NoteCubit.get(context).textcontroller.text,
                          date: '',
                        ),
                      );
                      Navigator.pop(context);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        var controller = context
                            .read<NoteCubit>()
                            .scrollController;
                        if (controller.hasClients) {
                          controller.animateTo(
                            controller.position.maxScrollExtent + 80,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      });
                    },
                  ),
                  CustomButton(
                    name: 'CANCEL',
                    color: Colors.lightBlueAccent,
                    size: Size(100, 40),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
