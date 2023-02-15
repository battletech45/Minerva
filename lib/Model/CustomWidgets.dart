import 'package:flutter/material.dart';
import 'package:minerva/View/ProfilePage.dart';

import '../View/ContentStudentPage.dart';

class customDrawer extends StatefulWidget {
  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.green,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.person, size: 50.0),
                Text('Metin Baybars Arslan', style: TextStyle(color: Colors.white,fontSize: 20))
              ],
            ),
          ),
          ListTile(
            title: Text('HOME',style: TextStyle(fontSize: 24),textAlign: TextAlign.center,),
            onTap: (){},

          ),
          ListTile(
            title: Text('PROFILE',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfilePage()));
            },
          ),
          ListTile(
            title: Text('GRADES',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){},
          ),
          ListTile(
            title: Text('ATTENDANCE',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){},
          ),
          ListTile(
            title: Text('CHAT',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){},
          ),
          ListTile(
            title: Text('ANNOUNCEMENTS',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){},
          ),
          ListTile(
            title: Text('CONTENT',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ContentStudent()));
            },
          ),
        ],
      ),
    );
  }
}