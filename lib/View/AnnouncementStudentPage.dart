import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AnnouncementStudentPage extends StatefulWidget {
  @override
  State<AnnouncementStudentPage> createState() => _AnnouncementStudentPageState();
}

class _AnnouncementStudentPageState extends State<AnnouncementStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150.0,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange[300],
        actions: <Widget>[
          Image.asset('assets/logo.png', alignment: Alignment.centerRight, height: 150, width: 150),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.deepOrange[300],
        child: ListView(
          //Listview hareketleri ve appBar durusu tam hosuma gitmedi Ona bakalim
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Text('Announcements', textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
            SizedBox(height: 30.0),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
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