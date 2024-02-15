external int compareTo(DateTime other);
class Todo{
  String name;
  DateTime TaskDate;
  bool isCompleted;
  Todo({
    required this.name,
    required this.TaskDate,
    required this.isCompleted
  });
  @override
  String toString(){
    return '${this.name }  ${this.TaskDate.year}/${this.TaskDate.month}/${this.TaskDate.day} ${this.TaskDate.hour}:${this.TaskDate.minute} \n' ;
  }
 
}
class ListTodo {
  late List<Todo> listtodo;
  
  ListTodo({
    List<Todo>? listtodo,
  }) : listtodo = listtodo ?? [];
  void initlist(){
    listtodo.add(Todo(name: "Learn OOP",isCompleted: true,TaskDate: DateTime(2024,2,2,12,45)));
    listtodo.add(Todo(name: "Learn French",isCompleted: false,TaskDate: DateTime(2025,5,2,12,45)));
    listtodo.add(Todo(name: "Learn Linux", isCompleted: true,TaskDate: DateTime(2023,7,2,12,45)));
    listtodo.add(Todo(name: "Learn English", isCompleted: true,TaskDate: DateTime(2021,12,2,12,45)));
    listtodo.add(Todo(name: "Learn Mobile", isCompleted: false,TaskDate: DateTime(2025,6,2,12,45)));
    listtodo.add(Todo(name: "Learn DSA",isCompleted: false ,TaskDate: DateTime(2025,7,6,12,45)));
    listtodo.add(Todo(name: "Learn KSA",isCompleted: false ,TaskDate: DateTime(2025,6,7,12,45)));
    listtodo.add(Todo(name: "Learn TAA", isCompleted: false,TaskDate: DateTime(2024,2,8,12,45)));

  }
  void AddNewTodo(Todo a){
    listtodo.add(a);
  }
  
  void delete(String todoName) {
    listtodo.removeWhere((todo) => todo.name == todoName);
  }

  List<Todo> searchTodo(String taskName) {
    return listtodo.where((element) => element.name.contains(taskName)).toList();
  }
  Todo GetItemAtIndex(int i){
    return listtodo.elementAt(i);
  }
  
  void showtodolist(){
    for(Todo i in listtodo){
      print(i);
    }
  }
  void Setter(ListTodo a){
    listtodo = a.listtodo;
  }
  int Getlength(){
    return listtodo.length;
  }
  List<Todo> GetList(){
    return this.listtodo;
  }
}

