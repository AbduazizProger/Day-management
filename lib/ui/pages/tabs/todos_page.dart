import 'package:day_management/ui/components/day_widget.dart';
import 'package:day_management/ui/components/todos.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({
    super.key,
    required this.showDays,
  });

  final List<String> showDays;

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  int _selectedDay = 6;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TodosWidget(selectedDay: widget.showDays[_selectedDay]),
        Container(
          constraints: const BoxConstraints(maxHeight: 65),
          padding: const EdgeInsets.all(2),
          color: Colors.black,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.showDays.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDay = index;
                    });
                  },
                  child: DayWidget(
                    showDays: widget.showDays,
                    index: index,
                    isSelected: _selectedDay == index,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
