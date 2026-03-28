import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    required this.color,
    required this.size, this.onPressed,
    
  });
  final String name;
  final Color color;
  final Size size;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(size),
        shape: WidgetStatePropertyAll(
          BeveledRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.zero),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(color),
      ),
      child: Text(name, style: TextStyle(color: Colors.white)),
    );
  }
}
