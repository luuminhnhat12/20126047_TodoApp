import 'package:flutter/material.dart';
import 'package:flutter_application_lab1/View/screen_addTodo.dart';
import 'package:flutter_application_lab1/model/model.dart';
import 'package:flutter_application_lab1/View/screen_today.dart';
import 'package:flutter_application_lab1/View/screen_upcoming.dart';
import 'package:flutter_application_lab1/View/screen_all.dart';
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
            ScreenAll(list: widget.list),
            ScreenToday(list: widget.list,),
            ScreenUpcoming(list:widget.list),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenAddTodo(list: widget.list),
              ),
            );
          },
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.add_circle_rounded,
            size: 29.0,
            color: Colors.white,
          )
        ),
      ),
    );
  }
}

