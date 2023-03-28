import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AnnouncementStudentPage extends StatefulWidget {
  @override
  State<AnnouncementStudentPage> createState() => _AnnouncementStudentPageState();
}
// merhabalar
class _AnnouncementStudentPageState extends State<AnnouncementStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text("ANNOUNCEMENTS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 30.0),
            Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 10.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 10.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 10.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 10.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 10.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),Card(
              color: PageColors.secondaryColor,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 10.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom'),
                    subtitle: Text('Announcement content for course XXXX.'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: customDrawer()
    );
  }
}