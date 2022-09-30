import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/controller.dart';

class TaskData extends StatelessWidget {
  const TaskData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<Controller>(context).taskList.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(
              Provider.of<Controller>(context).taskList[index],
              style: TextStyle(
                  decoration: Provider.of<Controller>(context).isDone1
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Wrap(children: [
              Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  value: Provider.of<Controller>(context).isCheckedList[index],
                  onChanged: (value) {
                    Provider.of<Controller>(context, listen: false)
                        .isCheckedList[index] = value!;
                    Provider.of<Controller>(context, listen: false).isChecked();
                  }),
              IconButton(
                  onPressed: (() {
                    Provider.of<Controller>(context, listen: false)
                        .taskList
                        .removeAt(index);
                    Provider.of<Controller>(context, listen: false).delete();
                  }),
                  icon: const Icon(Icons.delete))
            ]));
      },
    );
  }
}
