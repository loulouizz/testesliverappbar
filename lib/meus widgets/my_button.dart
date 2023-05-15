import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final int color;
  VoidCallback onPressed;

  MyButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return color == 0 ? Colors.grey : Colors.blue;
      }
      return color == 0 ? Colors.grey : Colors.blue;
    }

    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith(getColor)),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white, )),
    );
  }
} 