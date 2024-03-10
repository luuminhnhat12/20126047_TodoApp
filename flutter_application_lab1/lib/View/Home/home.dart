import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../Appbar/appbar.dart';
class Home extends StatelessWidget {
  final ListTodo list;
  const Home({
    Key? key, 
    required this.list,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print("rebuild");
    return Appbar(list: list);
  }
}