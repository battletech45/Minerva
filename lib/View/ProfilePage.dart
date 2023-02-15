import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
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
         
      drawer: customDrawer()
    );
  }
}