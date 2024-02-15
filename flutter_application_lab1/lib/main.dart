import 'package:flutter/material.dart';
import './View/Appbar/Appbar.dart';
import './model/model.dart';


void main() {
  runApp(const MainApp());

}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    ListTodo list = ListTodo();
    list.initlist();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scarfold(list: list,),
    );
  }
}
class Scarfold extends StatelessWidget {
  final ListTodo list;
  const Scarfold({
    Key? key, 
    required this.list,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print("rebuild");
    return Appbar(list: list);
  }
}

