import 'package:flutter/material.dart';
class TitleToday extends StatelessWidget {
  const TitleToday({
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
      child: Text('Today:${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
        style: const TextStyle(
          fontSize: 26,
          color: Color.fromARGB(255, 9, 121, 219),
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
