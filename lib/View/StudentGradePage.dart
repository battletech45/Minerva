import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';


class StudentGradePage extends StatefulWidget {
  const StudentGradePage({Key? key}) : super(key: key);

  @override
  State<StudentGradePage> createState() => _StudentGradePage();
}

class _StudentGradePage extends State<StudentGradePage> {
  bool expansionIcon=false;
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Grades'),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              customExpansionPanel(courseName: "Mathematics", examPoint: 24, quizPoint: 67, projectPoint: 89),
              SizedBox(height: 15.0),
              customExpansionPanel(courseName: "Biology", examPoint: 54, quizPoint: 23, projectPoint: 78),
              SizedBox(height: 15.0),
              customExpansionPanel(courseName: "Mathematics", examPoint: 24, quizPoint: 67, projectPoint: 89),

              SizedBox(height: 15.0),
              customExpansionPanel(courseName: "Mathematics", examPoint: 24, quizPoint: 67, projectPoint: 89),
              SizedBox(height: 15.0),
              customExpansionPanel(courseName: "Mathematics", examPoint: 24, quizPoint: 67, projectPoint: 89),
              SizedBox(
                height: 15,
              ),
              customExpansionPanel(courseName: "Mathematics", examPoint: 24, quizPoint: 67, projectPoint: 89),
              SizedBox(
                height: 15,
              ),
              Container(
                // color: PageColors.mainColor,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),),
                child: ExpansionTile(
                  title: Text("German"),
                  trailing: Icon(
                      expansionIcon? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, color: Colors.pink),
                  children: [
                    ListTile(
                      leading: Text("Exam: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Project: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Quiz: "),
                      trailing: Text("100"),
                    )
                  ],
                  onExpansionChanged: (bool expanded){
                    setState(()=> expansionIcon=expanded);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                // color: PageColors.mainColor,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),),
                child: ExpansionTile(
                  title: Text("Geography"),
                  trailing: Icon(
                      expansionIcon? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, color: Colors.pink),
                  children: [
                    ListTile(
                      leading: Text("Exam: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Project: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Quiz: "),
                      trailing: Text("100"),
                    )
                  ],
                  onExpansionChanged: (bool expanded){
                    setState(()=> expansionIcon=expanded);
                  },
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                // color: PageColors.mainColor,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),),
                child: ExpansionTile(
                  title: Text("English"),
                  trailing: Icon(
                      expansionIcon? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, color: Colors.pink),
                  children: [
                    ListTile(
                      leading: Text("Exam: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Project: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Quiz: "),
                      trailing: Text("100"),
                    )
                  ],
                  onExpansionChanged: (bool expanded){
                    setState(()=> expansionIcon=expanded);
                  },
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                // color: PageColors.mainColor,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black54,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),),
                child: ExpansionTile(
                  title: Text("Turkish"),
                  trailing: Icon(
                      expansionIcon? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, color: Colors.pink),
                  children: [
                    ListTile(
                      leading: Text("Exam: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Project: "),
                      trailing: Text("100"),
                    ),
                    ListTile(
                      leading: Text("Quiz: "),
                      trailing: Text("100"),
                    )
                  ],
                  onExpansionChanged: (bool expanded){
                    setState(()=> expansionIcon=expanded);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: customDrawer(),
    );
  }
}
