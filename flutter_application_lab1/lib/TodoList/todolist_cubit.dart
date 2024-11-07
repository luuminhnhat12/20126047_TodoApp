import 'package:flutter_application_lab1/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
  CUbit is a class provided by the flutter_bloc package that extends the Bloc class.
  It is used to manage the state of the application.
*/
class ListTodoCubit extends Cubit<List<Todo>> {
  ListTodoCubit(super.initialState);

  void addNewTodo(Todo a) {
    state.add(a);
    emit(state);
   // update();
  }
  void delete(String todoName) {
    state.removeWhere((todo) => todo.name == todoName);
    emit(state);
  }
  void updateTodo(String todoName, DateTime taskDate, bool isCompleted) {
    state.forEach((todo) {
      if (todo.name == todoName && todo.TaskDate == taskDate) {
        todo.isCompleted = isCompleted;
      }
    });
    emit(state);
  }
}