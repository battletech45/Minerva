import 'package:flutter/material.dart';
class ContentStudent extends StatefulWidget {
  const ContentStudent({super.key});

  @override
  State<ContentStudent> createState() => _ContentStudentState();
}

class _ContentStudentState extends State<ContentStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("MATERIALS",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                    GestureDetector(
                      onTap: () {
                       
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "Math",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "Chemistry",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "Physics",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "History",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "Biology",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "Turkish",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "English",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "German",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                         child: ListTile(
                          leading: Icon(Icons.class_),
                          title: Text(
                                    "Literature",
                                    textAlign: TextAlign.center,      
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
                                 ),           
                            ),
                      ),
                    ),
              ]),
            ),
          ],
        ),
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
class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}