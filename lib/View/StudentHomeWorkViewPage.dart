import 'package:flutter/material.dart';

class StudentHomeWorkViewPage extends StatefulWidget {
  @override
  _StudentHomeWorkViewPageState createState() => _StudentHomeWorkViewPageState();
}

class _StudentHomeWorkViewPageState extends State<StudentHomeWorkViewPage > {
  final List<HomeworkItem> homeworkItems = [
    HomeworkItem(
      name: 'Math homework',
      definition: 'solve the given problems',
    ),
    HomeworkItem(
      name: 'English essay',
      definition: 'wrote an 2 paragraph essay about Izmir fhgdfhgkj fdhkjgdfhkjghkfdjgh kjdfhgkdfk',
    ),
    HomeworkItem(
      name: 'Science project',
      definition: 'Search an AI project.',
    ),
    HomeworkItem(
      name: 'History reading',
      definition: 'Read the articles in the page 22',
    ),
  ];

  int _selectedIndex = -1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: homeworkItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(homeworkItems[index].name),
            onTap: () {
              _onItemTapped(index);
            },
          );
        },
      ),
      floatingActionButton: _selectedIndex != -1 ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = -1;
          });
        },
        child: Icon(Icons.clear),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomSheet: _selectedIndex != -1 ? Container(
        color: Colors.white,
        height: 150.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            homeworkItems[_selectedIndex].definition,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ) : null,
    );
  }
}

class HomeworkItem {
  final String name;
  final String definition;

  HomeworkItem({required this.name, required this.definition});
}
