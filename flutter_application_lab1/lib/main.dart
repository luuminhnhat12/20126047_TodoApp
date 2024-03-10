import 'package:flutter/material.dart';
import './View/Home/home.dart';
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
      home: Home(list: list,),
    );
  }
}


