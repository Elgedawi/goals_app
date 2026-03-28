import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_edit_dialoge.dart';

class GoalTile extends StatelessWidget {
  final int index;
  final String text;
  const GoalTile({super.key, required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomEditDialoge(index: index - 1),
        );
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 15, 49, 88),
                Colors.blue[500]!,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(3, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  '$index:$text',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
