import 'package:day_management/models/task.dart';
import 'package:day_management/models/tasks.dart';
import 'package:day_management/ui/components/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFormPage extends StatefulWidget {
  const CreateFormPage({super.key});

  @override
  State<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  final TextEditingController nameController = TextEditingController();
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  bool shouldNotify = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 4.0,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    fromTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ) ??
                        TimeOfDay.now();
                  },
                  child: const Text('From'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    toTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ) ??
                        TimeOfDay.now();
                  },
                  child: const Text('Till'),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      shouldNotify = !shouldNotify;
                    });
                  },
                  icon: Icon(shouldNotify ? Icons.check : Icons.close),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                if (fromTime != null && toTime != null) {
                  context.read<TasksModel>().add(
                        TaskModel(
                            name: nameController.text,
                            from: fromTime!,
                            to: toTime!,
                            shouldNotify: shouldNotify),
                        '${months[days[0].month - 1]}\n${days[0].day}',
                      );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Please enter all fields'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
