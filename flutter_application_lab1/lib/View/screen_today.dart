import 'package:flutter/material.dart';
import '../model/model.dart';

class ScreenToday extends StatefulWidget {
  final ListTodo list;
  const ScreenToday({
    super.key,
     required this.list,
  });

  @override
  State<ScreenToday> createState() => _ScreenTodayState();
}

class _ScreenTodayState extends State<ScreenToday> {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(top: 15.0),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                alignment:AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 17,
                  left: 12
                ),
                child: Text('Today:${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                    style: const TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(255, 9, 121, 219),
                   fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: 
                    ListView.builder(
                      itemCount: widget.list.getlength(),
                      itemBuilder:(context, index) {
                        Todo item = widget.list.getItemAtIndex(index);
                        DateTime now = DateTime.now();
                        if (item.TaskDate.year == now.year && item.TaskDate.month == now.month && 
                               item.TaskDate.day == now.day){
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
                              title: Text(
                                item.name,
                                style:const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),     
                              subtitle:  Text('${item.TaskDate.hour} : ${item.TaskDate.minute}',style: 
                                const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(7, 168, 255, 1)
                                ),
                              ),
                              leading: Checkbox(
                                value: item.isCompleted,
                                onChanged: (bool? value) {
                                  setState(() {
                                    item.isCompleted = value ?? false;
                                    }
                                  );
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
                                      }
                                    );
                                  },
                                )
                              ),
                            )
                          );
                        }
                        else{
                          return Container();
                        }
                      },  
                    )
                  ),
              )
            ]
        ),
      );
    }
}
