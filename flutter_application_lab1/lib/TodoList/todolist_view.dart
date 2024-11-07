/*
  TODOLIST VIEW: RESPONSIBLE FOR DISPLAYING THE TODOLIST VALUE
  use BlocBuilder to listen to the state changes and update the UI
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_lab1/TodoList/add%20new%20todo/addTodo_view.dart';
import 'package:flutter_application_lab1/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_lab1/TodoList/todolist_cubit.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: BlocBuilder<ListTodoCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].name),
                subtitle: Text(
                    '${state[index].TaskDate.year}/${state[index].TaskDate.month}/${state[index].TaskDate.day} ${state[index].TaskDate.hour}:${state[index].TaskDate.minute}'),
                trailing: Checkbox(
                  value: state[index].isCompleted,
                  onChanged: (value) {
                    context.read<ListTodoCubit>().updateTodo(
                        state[index].name, state[index].TaskDate, value!);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
              create: (_) => ListTodoCubit([]),
                child: AddNewTodoView(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}