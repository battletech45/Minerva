import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Container(
        color: Colors.deepOrange[300],
        alignment: Alignment.center,
        child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 55,
              ),
            ],),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                      shrinkWrap: true,
                      children: [
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.person_2_outlined),
                title: Text("Name Surname"),
                subtitle: Text("Yarkın Ata"),
                 trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.numbers_rounded),
                title: Text("Student Number"),
                subtitle: Text("0000000000000"),
                trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.class_rounded),
                title: Text("Class"),
                subtitle: Text("11-A"),
                 trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.school_rounded),
                title: Text("School Name"),
                subtitle: Text("Bornova Anadolu Lisesi"),
                 trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email_rounded),
                title: Text("Email"),
                subtitle: Text("studentemail@gmail.com"),
                 trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.password_rounded),
                title: Text("Password"),
                subtitle: Text("****************"),
                 trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                      Card(
              margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: ListTile(
                leading: Icon(Icons.password_rounded),
                title: Text("Password"),
                subtitle: Text("****************"),
                 trailing: Icon(Icons.edit_attributes_rounded),
              ),
                      ),
                    ]),
            ),
      ]),
        ),
         
      drawer: Drawer(
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
              onTap: (){},
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
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}