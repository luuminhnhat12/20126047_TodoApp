import 'package:flutter/material.dart';
import 'package:flutter_application_lab1/TodoList/todolist_page.dart';



void main() {
  runApp(const MainApp());

}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}


