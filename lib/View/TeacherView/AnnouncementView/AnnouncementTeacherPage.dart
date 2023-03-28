import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AnnouncementTeacherPage extends StatefulWidget {
  @override
  State<AnnouncementTeacherPage> createState() => _AnnouncementTeacherPageState();
}

class _AnnouncementTeacherPageState extends State<AnnouncementTeacherPage> {
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
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.add_comment_outlined, size: 40.0)),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined, size: 40.0)),
              ],
            ),
            SizedBox(height: 20.0),
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
            ),
          ],
        ),
      ),
      drawer: customDrawer()
    );
  }
}