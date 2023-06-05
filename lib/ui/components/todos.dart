import 'package:day_management/models/tasks.dart';
import 'package:day_management/ui/components/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosWidget extends StatelessWidget {
  const TodosWidget({
    super.key,
    required this.selectedDay,
  });

  final String selectedDay;

  @override
  Widget build(BuildContext context) {
    final TasksModel tasks = context.watch<TasksModel>();
    return ListView.builder(
      itemCount: tasks.tasks[selectedDay]!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(
                  top: 70.0,
                  bottom: 5.0,
                  left: 5.0,
                  right: 5.0,
                )
              : const EdgeInsets.all(5.0),
          child: TodoWidget(taskModel: tasks.tasks[selectedDay]![index]),
        );
      },
    );
  }
}
