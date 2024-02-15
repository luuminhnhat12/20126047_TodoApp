import 'package:flutter/material.dart';

import '../../model/model.dart';
class Upcoming extends StatefulWidget {
  final ListTodo list;

  const Upcoming({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: widget.list.Getlength(),
                itemBuilder: (context, index) {
                  Todo item = widget.list.GetItemAtIndex(index);
                  bool isTaskDateUpcoming = item.TaskDate.isAfter(DateTime.now());
                  if (isTaskDateUpcoming){
                    return Container(
                      decoration:const BoxDecoration(
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
                        offset:  Offset(1.0,2.5,),
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
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    tileColor: Colors.white,    
                    title: Text(item.name,
                    style:const TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                     ),
                    ),
                    subtitle: Text('${item.TaskDate.day}-${item.TaskDate.month}-${item.TaskDate.year} ${item.TaskDate.hour}:${item.TaskDate.minute}',
                    style: const TextStyle(fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(171, 255, 114, 82)
                     ),
                    ),
                    leading: Checkbox(
                      value: item.isCompleted,
                      onChanged: (bool? value) {
                      setState(() {
                        item.isCompleted = value ?? false;
              // widget.item.MarkCompleted();
                      });
                     },
                    ),
                    trailing:Container(
                     margin: const EdgeInsets.symmetric(vertical:3),
                     padding: const EdgeInsets.all(0),
                     height: 35,
                     width: 35,
                     child:IconButton(
                      iconSize: 24,
                      color: Colors.red,
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                       setState(() {
                        widget.list.delete(item.name);
                      });
                    },
                  )
                ),
               )
               );
                  }else{
                    return Container();
                  }
                  
                },
              ),
            ),
          ),
        ],
      ),
  );
  }
}