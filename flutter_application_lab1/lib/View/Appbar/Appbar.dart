import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../Today/Today.dart';
import '../Upcoming/Upcoming.dart';
import '../All/all.dart';
class Appbar extends StatefulWidget {
  const Appbar({
    super.key,
    required this.list,
  });

  final ListTodo list;

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          title:const Center(
            child:  Text(
              "Todo list",
              style: TextStyle(
                fontSize: 33,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.tealAccent.shade400,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "All",
                icon: Icon(Icons.all_inbox,
                size:27.0,
                color: Color.fromARGB(255, 193, 23, 255),
                  ),
              
              ),
              Tab(
                text: "Today",
                icon: Icon(Icons.calendar_today,
                size:27.0,
                color: Color.fromARGB(255, 244, 228, 54),
                ),
              ),
              Tab(
                text: "Upcoming",
                icon: Icon(Icons.upcoming,
                size:27.0,
                color: Color.fromARGB(255, 255, 64, 217),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            All(list: widget.list),
            Today(list: widget.list,),
            Upcoming(list:widget.list),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(context: context,builder: (context){
                DateTime selectedDate = DateTime.now();
                String name = '';
                Future<void> pickDateTime(BuildContext context) async {
                DateTime? pickedDateTime = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                );
                if (pickedDateTime != null) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: selectedDate.hour, minute: selectedDate.minute),
                  );
                  if (pickedTime != null) {
                    setState(() {
                        selectedDate = DateTime(
                        pickedDateTime.year,
                        pickedDateTime.month,
                        pickedDateTime.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    }
                  );
                } 
              }
              }
              return AlertDialog(
                title: const Text("New Todo"),
                  actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel', style: TextStyle(fontSize: 17)),
                  ),
                  TextButton(
                    onPressed: () {
                    setState(
                      (){
                        widget.list.AddNewTodo(Todo(name: name,isCompleted: false ,TaskDate: selectedDate));
                      }
                      );
                      Navigator.pop(context,'Add');
                    },
                    child: const Text('Add', style: TextStyle(fontSize: 17)),
                  ),
                ],
                content: Container(
                  height: 280,
                  child: Column(
                    children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            name = text;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: ElevatedButton(
                        onPressed: () {
                        pickDateTime(context);
                      },
                      child: Text(
                        '${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year} ${selectedDate.hour} : ${selectedDate.minute}',
                        style: const TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          );
          },
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.add_circle_rounded,
            size: 29.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

