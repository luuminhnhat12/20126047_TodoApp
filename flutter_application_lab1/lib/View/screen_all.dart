import 'package:flutter/material.dart';
import 'package:flutter_application_lab1/model/model.dart';

class ScreenAll extends StatefulWidget {
  final ListTodo list;
  
  const ScreenAll({
    super.key,
    required this.list,

  });

  @override
  State<ScreenAll> createState() => _ScreenAllState();
}

class _ScreenAllState extends State<ScreenAll> {
  List<Todo> foundToDo = [];

  @override
  void initState() {
    foundToDo = widget.list.listtodo;
    foundToDo.sort((a, b) => a.TaskDate.compareTo(b.TaskDate));
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Todo> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.list.listtodo;
    } else {
      results = widget.list.searchTodo(enteredKeyword);
    }

    setState(() {
      foundToDo = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding:const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  TextField(
              style: const TextStyle(fontSize: 22.0,fontWeight: FontWeight.w500),
              onChanged:(value) => runFilter(value),
              decoration:const InputDecoration(
                contentPadding:  EdgeInsets.all(0),
                prefixIcon:  Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),
                prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

          ),
          Container(
            alignment:AlignmentDirectional.topStart,
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 17,
              left: 12
            ),
            child: const Text("All ToDos",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 4, 100, 132),
                  fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: 
                  ListView.builder(
                   itemCount: foundToDo.length,
                   itemBuilder: (context, index) {
                      Todo item =  foundToDo[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:  Color.fromARGB(255, 129, 167, 186),
                              offset:  Offset(0.5,2.5,),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), 
                          ],
                        ),
                        child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            tileColor: Colors.white,
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${item.TaskDate.day}-${item.TaskDate.month}-${item.TaskDate.year} ${item.TaskDate.hour}:${item.TaskDate.minute}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(241, 244, 117, 54),
                              ),
                            ),
                            leading: Checkbox(
                              value: item.isCompleted,
                              onChanged: (bool? value) {
                                setState(() {
                                  item.isCompleted = value ?? false;
                                });
                              },
                            ),
                            trailing: Container(
                              margin: const EdgeInsets.symmetric(vertical: 3),
                              padding: const EdgeInsets.all(0),
                              height: 35,
                              width: 35,
                              child: IconButton(
                                iconSize: 24,
                                color: Colors.red,
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                  widget.list.delete(item.name);
                                }
                              );
                             },
                            ),
                          ),
                        )
                      );
                    },
                  ),
                ) 
              ),
            ]
          )
        );
      }
}

 
 
