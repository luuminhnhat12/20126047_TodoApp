import 'package:flutter/material.dart';
import '../../model/model.dart';
import 'appbar.dart';
class ScreenHome extends StatelessWidget {
  final ListTodo list;
  const ScreenHome({
    Key? key, 
    required this.list,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Appbar(list: list);
  }
}