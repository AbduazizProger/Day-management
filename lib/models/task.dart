import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  String name;
  TimeOfDay from;
  TimeOfDay to;
  bool isDone = false;
  bool shouldNotify;

  TaskModel({
    required this.name,
    required this.from,
    required this.to,
    required this.shouldNotify,
  }) {
    notifyListeners();
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
      from: TimeOfDay(
        hour: int.fromEnvironment(json['from'].toString().split('-')[0]),
        minute: int.fromEnvironment(json['from'].toString().split('-')[1]),
      ),
      to: TimeOfDay(
        hour: int.fromEnvironment(json['to'].toString().split('-')[0]),
        minute: int.fromEnvironment(json['to'].toString().split('-')[1]),
      ),
      shouldNotify: json['shouldNotify'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'from': '${from.hour}-${from.minute}',
      'to': '${to.hour}-${to.minute}',
      'shouldNotify': shouldNotify,
    };
  }

  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }

  void changeContent(String newContent) {
    name = newContent;
    notifyListeners();
  }

  void changeFrom(TimeOfDay newFrom) {
    from = newFrom;
    notifyListeners();
  }

  void changeTo(TimeOfDay newTo) {
    to = newTo;
    notifyListeners();
  }

  void changeIsDone() {
    isDone = !isDone;
    notifyListeners();
  }

  void changeShouldNotify() {
    shouldNotify = !shouldNotify;
    notifyListeners();
  }
}
