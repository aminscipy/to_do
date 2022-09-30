import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/controller.dart';

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
                Provider.of<Controller>(context, listen: false).taskName(value);
              },
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              Provider.of<Controller>(context, listen: false).addTask();
            },
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
