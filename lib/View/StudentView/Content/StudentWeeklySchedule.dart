import 'package:flutter/material.dart';
import '../../../Model/WidgetProperties.dart';

class StudentWeeklySchedule extends StatefulWidget {
  const StudentWeeklySchedule({Key? key}) : super(key: key);

  @override
  State<StudentWeeklySchedule> createState() => _StudentWeeklyScheduleState();
}

class _StudentWeeklyScheduleState extends State<StudentWeeklySchedule> {
  bool _examSchedule = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("Weekly Schedule",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5.0)),
          Table(
          border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                  height: 40,
                  child: Text('')),
            ),
            TableCell(
              child: Text('Monday'),
            ),
            TableCell(
              child: Text('Tuesday'),
            ),
            TableCell(
              child: Text('Wednesday'),
            ),
            TableCell(
              child: Text('Thursday'),
            ),
            TableCell(
              child: Text('Friday'),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('08:00 - 08:40'),
            ),
            TableCell(
              child: Container(
                color: Colors.blue,
                child: Text('Math'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.green,
                child: Text('Physics'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.red,
                child: Text('History'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.yellow,
                child: Text('Chemistry'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.orange,
                child: Text('English'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('08:50 - 09.30'),
            ),
            TableCell(
              child: Container(
                color: Colors.blue,
                child: Text('Math'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.green,
                child: Text('Physics'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.red,
                child: Text('History'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.yellow,
                child: Text('Chemistry'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.orange,
                child: Text('English'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('09:40 - 10:20'),
            ),
            TableCell(
              child: Container(
                color: Colors.pink,
                child: Text('Turkish'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.pink,
                child: Text('Turkish'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.deepPurple,
                child: Text('Geography'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.orange,
                child: Text('English'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.yellow,
                child: Text('Chemistry'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('10:30 - 11.10'),
            ),
            TableCell(
              child: Container(
                color: Colors.pink,
                child: Text('Turkish'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.pink,
                child: Text('Turkish'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.deepPurple,
                child: Text('Geography'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.orange,
                child: Text('English'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.yellow,
                child: Text('Chemistry'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('11:20 - 12:00'),
            ),
            TableCell(
              child: Container(
                color: Colors.red,
                child: Text('History'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.blue,
                child: Text('Math'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.green,
                child: Text('Physics'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.deepPurple,
                child: Text('Geography'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.tealAccent,
                child: Text('Literature'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('12:10 - 12:50'),
            ),
            TableCell(
              child: Container(
                color: Colors.red,
                child: Text('History'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.blue,
                child: Text('Math'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.green,
                child: Text('Physics'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.deepPurple,
                child: Text('Geography'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.tealAccent,
                child: Text('Literature'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('12.50 - 13.30'),
            ),
            TableCell(
              child: Container(
                color: Colors.grey,
                child: Text('Break'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.grey,
                child: Text('Break'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.grey,
                child: Text('Break'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.grey,
                child: Text('Break'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.grey,
                child: Text('Break'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('13:40 - 14:20'),
            ),
            TableCell(
              child: Container(
                color: Colors.lightGreenAccent,
                child: Text('German'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.yellow,
                child: Text('Chemistry'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.lightGreenAccent,
                child: Text('German'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.blue,
                child: Text('Math'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.tealAccent,
                child: Text('Literature'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('14:30 - 15:10'),
            ),
            TableCell(
              child: Container(
                color: Colors.lightGreenAccent,
                child: Text('German'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.yellow,
                child: Text('Chemistry'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.lightGreenAccent,
                child: Text('German'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.blue,
                child: Text('Math'),
              ),
            ),
            TableCell(
              child: Container(
                color: Colors.tealAccent,
                child: Text('Literature'),
              ),
            ),
          ],
        ),

      ],
    ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top:20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded){
                    setState(() {
                      if(index == 0){
                        _examSchedule = !isExpanded;
                      }
                    });
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: _examSchedule,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading: Icon(Icons.date_range),
                          title: Text(
                            'Exam Dates',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      body: SingleChildScrollView(
                        child: ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Expanded(
                              child: Container(
                              //padding: EdgeInsets.all(16),
                              child: Text(
                                'Exams',
                              ),
                                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ],
            ),
          ),

        ],
      ),
      /*
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                Navigator.pop(context); 
                })
          ],
        ),
      ),
      drawer: customDrawer(),
      */
    );
  }
}
