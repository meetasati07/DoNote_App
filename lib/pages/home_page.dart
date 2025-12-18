import 'package:flutter/material.dart';
import 'package:notes_app/pages/notes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesPage(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_sharp),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.task_outlined), label: ''),
        ],
      ),
    );
  }
}