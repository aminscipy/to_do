import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/controller.dart';

class TaskData extends StatelessWidget {
  const TaskData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (context, controller, child) {
      return ListView.builder(
          itemCount: Provider.of<Controller>(context).taskList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(
                  controller.taskList[index],
                  style: TextStyle(
                      decoration: controller.isCheckedList[index]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                trailing: Wrap(children: [
                  Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: controller.isCheckedList[index],
                      onChanged: (value) {
                        controller.isCheckedList[index] = value!;
                        controller.isChecked();
                      }),
                  IconButton(
                      onPressed: (() {
                        controller.taskList.removeAt(index);
                        controller.delete();
                      }),
                      icon: const Icon(Icons.delete))
                ]));
          });
    });
  }
}
