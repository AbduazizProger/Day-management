import 'package:day_management/models/task.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.taskModel,
  });

  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 10, 6, 117),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurStyle: BlurStyle.outer,
            blurRadius: 5,
            color: Colors.grey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                taskModel!.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${taskModel!.from.hour.toString()}:${taskModel!.from.minute.toString()} - ${taskModel!.to.hour.toString()}:${taskModel!.to.minute.toString()}',
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                !taskModel!.isDone ? Icons.close : Icons.done,
                size: 35,
                color: Colors.red,
              ),
              Text(
                !taskModel!.isDone ? 'Not done yet' : 'Done👍',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
