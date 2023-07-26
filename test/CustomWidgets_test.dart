
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/Model/WidgetProperties.dart';

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
      userName: 'Baybars Arslan',
      content: 'This is a text content',
      contentID: '4YFA6cjqiMANy9CH2nrn',
    );

    // Render the widget
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: customFeed)));

    // Verify that the user name is displayed
    expect(find.text('Baybars Arslan '), findsOneWidget);

    // Verify that the text content is displayed
    expect(find.text('This is a text content'), findsOneWidget);
  });



  testWidgets('Tapping the like button increments the counter', (WidgetTester tester) async {

    final customFeed = customContentFeed(
      userName: 'Baybars Arslan',
      content: 'Hello World!',
      contentID: '4YFA6cjqiMANy9CH2nrn',
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


    //customCheckBoxListTile 
testWidgets('checkbox should update selected class', (WidgetTester tester) async {
      // Arrange
      final classes = ['Class A', 'Class B', 'Class C'];
      String? selectedClass;
      Function callback = (String? value) => selectedClass = value;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: customCheckBoxListTile(
            classes: classes,
            index: 1,
            function: callback,
          ),
        ),
      ));

      // Act
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      // Assert
      expect(selectedClass, classes[1]);
    });

    //customEditCheckBoxListTile
testWidgets('customEditCheckBoxListTile widget should work', (WidgetTester tester) async {
  // Define the widget under test
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: customEditCheckBoxListTile(
        hours: '10:00 AM - 12:00 PM',
        selected: false,
        onPressed: (String hours) {},
        onChange: () {},
      ),
    ),
  ));

  // Verify that the checkbox tile is displayed
  expect(find.byType(CheckboxListTile), findsOneWidget);

  // Verify that the hours are displayed
  expect(find.text('10:00 AM - 12:00 PM'), findsOneWidget);

  // Verify that the checkbox is unchecked initially
  expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, false);

  // Tap the checkbox
  await tester.tap(find.byType(CheckboxListTile));
  await tester.pump();

  // Verify that the onPressed and onChange functions are called and the checkbox is checked
  expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, true);
});

    //customCourseGrid
testWidgets('customCourseGrid displays course name and book icon', (WidgetTester tester) async {
  final String courseName = 'Mathematics';
  await tester.pumpWidget(MaterialApp(home: customCourseGrid(courseName: courseName)));
  
  expect(find.text(courseName), findsOneWidget);
  expect(find.byIcon(FontAwesomeIcons.bookOpen), findsOneWidget);
});


   // selectedFileList
  testWidgets('should display file name when a file is selected', (WidgetTester tester) async {
    // Arrange
    final pickedFile = PlatformFile(
      name: 'test_file.jpg',
      size: 1024,
      path: '/path/to/test_file.jpg',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: selectedFileList(pickedFile: pickedFile),
        ),
      ),
    );

    // Act
    final fileTextFinder = find.text('test_file.jpg');

    // Assert
    expect(fileTextFinder, findsOneWidget);
  });

  testWidgets('should display file icon when a file is selected', (WidgetTester tester) async {
    // Arrange
    final pickedFile = PlatformFile(
      name: 'test_file.jpg',
      size: 1024,
      path: '/path/to/test_file.jpg',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: selectedFileList(pickedFile: pickedFile),
        ),
      ),
    );

    // Act
    final fileIconFinder = find.byIcon(FontAwesomeIcons.file);

    // Assert
    expect(fileIconFinder, findsOneWidget);
  });

  testWidgets('should not display anything when no file is selected', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: selectedFileList(pickedFile: null),
        ),
      ),
    );

    // Act
    final fileIconFinder = find.byIcon(FontAwesomeIcons.file);
    final fileTextFinder = find.text('');

    // Assert
    expect(fileIconFinder, findsNothing);
    expect(fileTextFinder, findsNothing);
  });



  //customAnnouncementCard
  testWidgets('customAnnouncementCard should display teacher name and announcement content', (WidgetTester tester) async {
    // Arrange
    const teacherName = 'Baybars Arslan';
    const announcementContent = 'Hello Students.';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: customAnnouncementCard(
            teacherName: teacherName,
            announcementContent: announcementContent,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(teacherName), findsOneWidget);
    expect(find.text(announcementContent), findsOneWidget);
  });

  testWidgets('customAnnouncementCard should display teacher icon', (WidgetTester tester) async {
    // Arrange
    const teacherName = 'Baybars Arslan';
    const announcementContent = 'hello students.';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: customAnnouncementCard(
            teacherName: teacherName,
            announcementContent: announcementContent,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('customAnnouncementCard should have secondary color', (WidgetTester tester) async {
    // Arrange
    const teacherName = 'Baybars Arslan';
    const announcementContent = 'hello students.';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: customAnnouncementCard(
            teacherName: teacherName,
            announcementContent: announcementContent,
          ),
        ),
      ),
    );

    // Assert
    final card = tester.widget<Card>(find.byType(Card));
    expect(card.color, equals(PageColors.secondaryColor));
  });

  testWidgets('customAnnouncementCard should have border radius of 10', (WidgetTester tester) async {
    // Arrange
    const teacherName = 'Baybars Arslan';
    const announcementContent = 'hello students.';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: customAnnouncementCard(
            teacherName: teacherName,
            announcementContent: announcementContent,
          ),
        ),
      ),
    );

    // Assert
    final card = tester.widget<Card>(find.byType(Card));
    expect(card.shape, equals(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
  });

  //customAlert
  testWidgets('customAlertState cancelButton test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: customAlert()));

    // Find the cancel button
    final cancelButtonFinder = find.widgetWithText(MaterialButton, 'Cancel');
    expect(cancelButtonFinder, findsOneWidget);

    // Tap the cancel button and verify that it pops the alert dialog
    await tester.tap(cancelButtonFinder);
    await tester.pumpAndSettle();
    expect(find.byType(customAlert), findsNothing);
  });

  //customEditExpansionPanel
  testWidgets('customEditExpansionPanel test', (WidgetTester tester) async {
    void _testFunction() {

    }
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      body: ListView(
        children: [
          customEditExpansionPanel(name: 'test', function: () => _testFunction())
        ],
      ),
    )
    )
    );

    final expansionTileFinder = find.widgetWithText(ExpansionTile, 'test');
    expect(expansionTileFinder, findsOneWidget);

    await tester.tap(expansionTileFinder);
    await tester.pumpAndSettle();
    expect(find.byType(customEditExpansionPanel), findsOneWidget);
  });

  //customClassListCheckboxBuilder
  testWidgets('customClassListCheckBoxBuilder', (WidgetTester tester) async {

    final classes = ['Class A', 'Class B', 'Class C'];
    void _testFunction() {

    }
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: customClassListCheckboxBuilder(classes: classes, function: () => _testFunction()),
      ),
    ));
    await tester.tap(find.byType(customClassListCheckboxBuilder));
    await tester.pumpAndSettle();
    expect(find.text(''), findsNothing);
  });

}






