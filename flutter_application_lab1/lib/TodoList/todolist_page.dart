/*
  COUNTER PAGE : RESPONSIBLE FOR PROVIDING COUNTER CUBIT TO THE COUNTER_VIEW (UI)
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_lab1/TodoList/todolist_cubit.dart';
import 'package:flutter_application_lab1/TodoList/todolist_view.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListTodoCubit([]),
      child: TodoListView(),
    );
  }
}