import 'package:day_management/models/task.dart';
import 'package:day_management/ui/components/resources.dart';
import 'package:flutter/material.dart';

class TasksModel extends ChangeNotifier {
  final Map<String, List<TaskModel>> tasks = {
    '${months[days[6].month - 1]}\n${days[6].day}': [],
    '${months[days[5].month - 1]}\n${days[5].day}': [],
    '${months[days[4].month - 1]}\n${days[4].day}': [],
    '${months[days[3].month - 1]}\n${days[3].day}': [],
    '${months[days[2].month - 1]}\n${days[2].day}': [],
    '${months[days[1].month - 1]}\n${days[1].day}': [],
    '${months[days[0].month - 1]}\n${days[0].day}': [],
  };

  TasksModel() {}

  void add(TaskModel task, String day) {
    tasks[day]!.add(task);
    notifyListeners();
  }

  void delete(String day) {
    tasks.remove(day);
    notifyListeners();
  }
}
