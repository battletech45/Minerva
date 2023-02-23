// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';

import '../Model/ColorPlates.dart';

class StudentGradePage extends StatefulWidget {
  const StudentGradePage({Key? key}) : super(key: key);

  @override
  State<StudentGradePage> createState() => _StudentGradePage();
}

class _StudentGradePage extends State<StudentGradePage> {
  //final Color mainColor= Color.fromRGBO(28, 88, 140, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Grades',
        ),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Card(
                elevation: 10.0,
                shape: Border.all(
                  width: 2,
                  color: Colors.black54,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Mathematics"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Physics"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Chemistry"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Biology"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Literature"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("History"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("German"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Geography"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("English"),
                  onTap: () {},
                ),
              ),
              Card(
                elevation: 10.0,
                shape: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                shadowColor: PageColors.mainColor,
                child: ListTile(
                  trailing: Icon(Icons.grade_sharp, color: Colors.pink),
                  title: Text("Turkish"),
                  onTap: () {},
                ),
              ),
            ]),
      ),
      drawer: customDrawer(),
    );
  }
}
