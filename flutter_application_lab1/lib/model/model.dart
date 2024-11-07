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
