import 'package:flutter/material.dart';

String? taskName;
List<Widget> taskList = [];

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          const Text(
            'Add task',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              onChanged: (value) {
                taskName = value;
              },
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: (() {
              taskList.add(Task(name: taskName));
            }),
            style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]),
      ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({super.key, this.name});
  final String? name;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isDone = false;
  String? name;

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          name!,
          style: TextStyle(
              decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        trailing: Checkbox(
          activeColor: Colors.white,
          checkColor: Colors.black,
          value: isDone,
          onChanged: (value) {
            setState(() {
              isDone = value!;
            });
          },
        ));
  }
}
