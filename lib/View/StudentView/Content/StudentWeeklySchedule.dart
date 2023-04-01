import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../Model/WidgetProperties.dart';

class StudentWeeklySchedule extends StatefulWidget {
  const StudentWeeklySchedule({Key? key}) : super(key: key);

  @override
  State<StudentWeeklySchedule> createState() => _StudentWeeklyScheduleState();
}

class _StudentWeeklyScheduleState extends State<StudentWeeklySchedule> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  Map<DateTime, List<Lesson>> _events = {
    DateTime.now(): [
      Lesson('Math', Colors.blue, TimeOfDay(hour: 12, minute: 0),
          TimeOfDay(hour: 12, minute: 40)),
      Lesson('Physics', Colors.green, TimeOfDay(hour: 12, minute: 50),
          TimeOfDay(hour: 15, minute: 30))
    ],
    DateTime.now().add(Duration(days: 1)): [
      Lesson('Chemistry', Colors.red, TimeOfDay(hour: 10, minute: 0),
          TimeOfDay(hour: 11, minute: 30)),
      Lesson('Biology', Colors.orange, TimeOfDay(hour: 12, minute: 0),
          TimeOfDay(hour: 13, minute: 30))
    ],
    DateTime.now().add(Duration(days: 2)): [
      Lesson('History', Colors.purple, TimeOfDay(hour: 9, minute: 0),
          TimeOfDay(hour: 10, minute: 30)),
      Lesson('Geography', Colors.brown, TimeOfDay(hour: 11, minute: 0),
          TimeOfDay(hour: 12, minute: 30))
    ],
    DateTime.now().add(Duration(days: 3)): [
      Lesson('English', Colors.teal, TimeOfDay(hour: 8, minute: 30),
          TimeOfDay(hour: 9, minute: 45)),
      Lesson('German', Colors.blueGrey, TimeOfDay(hour: 10, minute: 0),
          TimeOfDay(hour: 11, minute: 15)),
      Lesson('Literature', Colors.amber, TimeOfDay(hour: 14, minute: 0),
          TimeOfDay(hour: 15, minute: 30))
    ],
    DateTime.now().add(Duration(days: 4)): [
      Lesson('Turkish', Colors.deepPurple, TimeOfDay(hour: 11, minute: 0),
          TimeOfDay(hour: 12, minute: 30))
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text("Weekly Schedule"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyle(color: Colors.red),
              holidayTextStyle: TextStyle(color: Colors.green),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red),
            ),
            headerVisible: true,
            calendarBuilders:
                CalendarBuilders(markerBuilder: (context, date, events) {
              final children = <Widget>[];
              if (events.isNotEmpty) {
                children.add(
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: _buildEventsMarker(date, events),
                  ),
                );
              }
            }),
          ),

        ],

      ),
      drawer: customDrawer(),
    );
  }
  List<Lesson> _getEventsForDay(DateTime date) {
    // Get the lessons for the given `date` (only weekdays)
    if (date.weekday >= 1 && date.weekday <= 5) {
      final lessons = _events[date];
      return lessons ?? [];
    }
    return [];
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[400]!,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Lesson {
  final String name;
  final Color color;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const Lesson(this.name, this.color, this.startTime, this.endTime);
}
