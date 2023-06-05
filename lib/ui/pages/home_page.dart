import 'package:day_management/ui/components/resources.dart';
import 'package:day_management/ui/pages/create_form.dart';
import 'package:day_management/ui/pages/tabs/settings_page.dart';
import 'package:day_management/ui/pages/tabs/todos_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  List<String> showDays = [
    '${months[days[6].month - 1]}\n${days[6].day}',
    '${months[days[5].month - 1]}\n${days[5].day}',
    '${months[days[4].month - 1]}\n${days[4].day}',
    '${months[days[3].month - 1]}\n${days[3].day}',
    '${months[days[2].month - 1]}\n${days[2].day}',
    '${months[days[1].month - 1]}\n${days[1].day}',
    '${months[days[0].month - 1]}\n${days[0].day}',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day management'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _selectedTab == 0
          ? TodosPage(showDays: showDays)
          : const SettingsTab(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const CreateFormPage();
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedTab = value;
          });
        },
        currentIndex: _selectedTab,
        backgroundColor: Colors.black,
        selectedIconTheme: const IconThemeData(size: 30),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setttings',
          ),
        ],
      ),
    );
  }
}
