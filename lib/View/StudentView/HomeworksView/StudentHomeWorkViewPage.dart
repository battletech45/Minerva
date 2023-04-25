import 'package:flutter/material.dart';

import '../../../Model/WidgetProperties.dart';

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
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: PageColors.mainColor, width: 3),
          )
        ),
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(homeworkItems[_selectedIndex].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                homeworkItems[_selectedIndex].definition,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            //homeworkItems[_selectedIndex].fileName!.isEmpty ? null : Text(homeworkItems[_selectedIndex].fileName!),
            MaterialButton( child: Text('Submit'),onPressed: () {})
          ],
        ),
      ) : null,
    );
  }
}

class HomeworkItem {
  final String name;
  final String definition;
  final String? fileName;

  HomeworkItem({required this.name, required this.definition, this.fileName});
}
