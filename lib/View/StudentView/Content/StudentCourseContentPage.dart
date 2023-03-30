import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/StudentView/Content/ContentStudentPage.dart';
import 'package:minerva/View/StudentView/HomeworksView/StudentFileUpload.dart';
import '../../../Model/WidgetProperties.dart';

class CourseContent extends StatefulWidget {
  final String courseName;
  const CourseContent({Key? key, required this.courseName}) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  bool _announcementsExpanded= false;
  bool _materialsExpanded = false;
  bool _assesmentsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text(widget.courseName,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  if (index == 0) {
                    _announcementsExpanded = !isExpanded;
                  } else if (index == 1) {
                    _materialsExpanded = !isExpanded;
                  }
                  else if (index == 2){
                    _assesmentsExpanded=!isExpanded;
                  }
                });
              },
              children: [
                ExpansionPanel(
                  isExpanded: _announcementsExpanded,
                  headerBuilder: (BuildContext context, bool isExpanded) {

                    return ListTile(
                      leading: Icon(Icons.announcement_outlined),

                      title: Text('Announcements',style: TextStyle(fontWeight: FontWeight.bold),),
                    );
                  },
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text('Announcements',),
                    ),
                  ),
                ),
                ExpansionPanel(
                  isExpanded: _materialsExpanded,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.content_copy_outlined),
                      title: Text('Materials',style: TextStyle(fontWeight: FontWeight.bold),),
                    );
                  },
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text(' Materials '),
                    ),
                  ),
                ),

                ExpansionPanel(
                  isExpanded: _assesmentsExpanded,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.assignment_outlined),
                      title: Text('Assesments',style: TextStyle(fontWeight: FontWeight.bold),),
                    );
                  },
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text(' Assesments '),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: PageColors.thirdColor),
                child: Text('Upload File'),onPressed: (){
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => StudentUploadHomework()));
    }

              ,),
            )

          ],
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            IconButton( icon: Icon(Icons.arrow_back),onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContentStudent()));
            })
          ],
        ),
      ),
      drawer: customDrawer(),
    );
  }
}