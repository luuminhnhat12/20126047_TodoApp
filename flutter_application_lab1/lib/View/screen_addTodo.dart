import 'package:flutter/material.dart';
import 'package:flutter_application_lab1/View/screen_all.dart';
import 'package:flutter_application_lab1/model/model.dart';
import 'package:quickalert/quickalert.dart';

class ScreenAddTodo extends StatefulWidget {
  final ListTodo list;
  const ScreenAddTodo({super.key,required this.list});

  @override
  State<ScreenAddTodo> createState() => _ScreenAddTodoState();
}

class _ScreenAddTodoState extends State<ScreenAddTodo> {
  DateTime selectedDate = DateTime.now();
  String name = '';
  Future<void> pickDateTime(BuildContext context) async {
    final DateTime? pickDateTime = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: selectedDate.hour, minute: selectedDate.minute),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDate = DateTime(
            pickDateTime.year,
            pickDateTime.month,
            pickDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
            );
          }
        );
      } 
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo",
            style: TextStyle(
              fontSize: 33,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  labelStyle: TextStyle(fontSize: 22.0),
                  )
                ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Add Date and Time:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                  backgroundColor: Color.fromARGB(255, 100, 165, 255),
                  padding: const EdgeInsets.all(15.0),
                  textStyle: const TextStyle(fontSize: 17.0,fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  pickDateTime(context);
                },
                child: Text(
                 '${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year} ${selectedDate.hour} : ${selectedDate.minute}',
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
                    backgroundColor:  const Color.fromARGB(255, 118, 100, 255),
                    padding: const EdgeInsets.all(15.0),
                    textStyle: const TextStyle(fontSize: 22.0),
                  ),
                  onPressed:  () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
                    backgroundColor: name.isEmpty ? Colors.grey : Colors.blue,
                    padding: const EdgeInsets.all(15.0),
                    textStyle: const TextStyle(fontSize: 22.0),
                  ),
                  onPressed:name.isEmpty ? null : () {
                    Navigator.pop(context,"added");
                    setState(() {
                      widget.list.addNewTodo(Todo(name: name,isCompleted: false ,TaskDate: selectedDate));
                    });
                    QuickAlert.show(
                      context: context,
                      title: "Success",
                      text: "Todo added successfully",
                      type: QuickAlertType.success,
                      autoCloseDuration: const Duration(seconds: 2),
                    );
                  },
                  child: const Text("Add"),
                ),
        
              ],
            ),
          ],
        ),
      ),
    );

  }
}