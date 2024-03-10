import 'package:flutter/material.dart';
class Title_AllTodo extends StatelessWidget {
  const Title_AllTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:AlignmentDirectional.topStart,
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 17,
        left: 12
      ),
      child: const Text("All ToDos",
        style: TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 4, 100, 132),
        fontWeight: FontWeight.bold),
      ),
    );
  }
}
