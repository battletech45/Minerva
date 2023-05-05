import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/CustomWidgets.dart';

void main() {

  // customDrawer
  testWidgets('Drawer items', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: customDrawer(),
      ),
    ));

    // Verify that the drawer contains the Home item
    expect(find.text('Home'), findsOneWidget);
    // Verify that the drawer contains the Profile item
    expect(find.text('Profile'), findsOneWidget);
    // Verify that the drawer contains the Grades item
    expect(find.text('Grades'), findsOneWidget);
    // Verify that the drawer contains the Attendance item
    expect(find.text('Attendance'), findsOneWidget);
    // Verify that the drawer contains the Chat item
    expect(find.text('Chat'), findsOneWidget);
    // Verify that the drawer contains the Announcement item
    expect(find.text('Announcement'), findsOneWidget);
    // Verify that the drawer contains the Content item
    expect(find.text('Content'), findsOneWidget);

  }
  );
  testWidgets('Tapping Profile item navigates to profile screen', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: customDrawer(),
      ),
    ));

    // Tap the Profile item
    await tester.tap(find.text('Profile'));
    await tester.pump();

    // Verify that the profile screen is displayed
    expect(find.text('Profile'), findsOneWidget);

    // Tap the Grades item
    await tester.tap(find.text('Grades'));
    await tester.pump();

    // Verify that the Grades screen is displayed
    expect(find.text('Grades'), findsOneWidget);


  });

  testWidgets('Drawer has a header', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: customDrawer(),
      ),
    ));

    // Verify that the drawer contains a header
    expect(find.byType(DrawerHeader), findsOneWidget);
  });

  //customAttendanceCard
  testWidgets('customAttendanceCard displays correct information', (WidgetTester tester) async {
    // Create a customAttendanceCard widget with some dummy information
    final customAttendanceCardWidget = customAttendanceCard(
      teacherName: 'Baybars Arslan',
      courseName: 'Math',
      attendance: '10',
    );

    // Add the widget
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: customAttendanceCardWidget)));

    // Expect to find the teacher name
    expect(find.text('Baybars Arslan'), findsOneWidget);

    // Expect to find the course name
    expect(find.text('Course Name'), findsOneWidget);
    expect(find.text('Math'), findsOneWidget);

    // Expect to find the attendance
    expect(find.text('Attendance'), findsOneWidget);
    expect(find.text('10 Hours'), findsOneWidget);

    // verify that the teacher name style is correct
    final teacherNameWidget = tester.widget<Text>(
      find.descendant(
        of: find.byType(customAttendanceCard),
        matching: find.byType(Text).first,
      ),
    );
    expect(
      teacherNameWidget.style!.fontSize,
      equals(20),
    );
    // verify that the course name style is correct
    final courseNameWidget = tester.widget<Text>(
      find.descendant(
        of: find.byType(customAttendanceCard),
        matching: find.text('Course Name'),
      ),
    );
    expect(
      courseNameWidget.style!.fontWeight,
      equals(FontWeight.bold),
    );
    // verify that the Attendance style is correct
    final attendanceWidget = tester.widget<Text>(
      find.descendant(
        of: find.byType(customAttendanceCard),
        matching: find.text('Attendance'),
      ),
    );
    expect(
      attendanceWidget.style!.fontStyle,
      equals(FontStyle.italic),
    );

  });

  //customContentFeed
  testWidgets('Test whether customContentFeed displays text', (WidgetTester tester) async {
    // Create a customContentFeed widget with a text content
    final customFeed = customContentFeed(
      userName: 'John Doe',
      content: 'This is a text content',
    );

    // Render the widget
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: customFeed)));

    // Verify that the user name is displayed
    expect(find.text('John Doe'), findsOneWidget);

    // Verify that the text content is displayed
    expect(find.text('This is a text content'), findsOneWidget);
  });



  testWidgets('Tapping the like button increments the counter', (WidgetTester tester) async {

    final customFeed = customContentFeed(
      userName: 'Baybars Arslan',
      content: 'Hello World!',
    );

    // render the widget
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: customFeed)));

    // verify that the initial counter value is 0
    expect(find.text('0'), findsOneWidget);

    // tap the like button
    await tester.tap(find.byIcon(FontAwesomeIcons.heart));
    await tester.pump();

    // verify that the counter value is incremented to 1
    expect(find.text('1'), findsOneWidget);
  });


  //customExpansionPanel
  
  testWidgets('customExpansionPanel should expand when tapped',
          (WidgetTester tester) async {

        await tester.pumpWidget(MaterialApp(
            home: Scaffold(
                body: customExpansionPanel(
                  courseName: 'Mathematics',
                  examPoint: '80',
                  projectPoint: '90',
                  quizPoint: '70',
                ))));

        // Verify that the widget displays the course name
        expect(find.text('Mathematics'), findsOneWidget);

        // Verify that the widget is not expanded initially
        expect(find.text('Exam: '), findsNothing);
        expect(find.text('Project: '), findsNothing);
        expect(find.text('Quiz: '), findsNothing);

        // Tap the expansion tile to expand it
        await tester.tap(find.byType(ExpansionTile));
        await tester.pump();

        // Verify that the widget is expanded
        expect(find.text('Exam: '), findsOneWidget);
        expect(find.text('Project: '), findsOneWidget);
        expect(find.text('Quiz: '), findsOneWidget);
      });







}



