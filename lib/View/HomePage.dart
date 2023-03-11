import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Model/CustomWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("HOME", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget> [
             // SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: CircleAvatar(
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("Yarkın Ata",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                     color: PageColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
              Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                      child:IconButton(
                        icon: click ? Icon(FontAwesomeIcons.solidHeart,size: 38,color: Colors.red,) : Icon(FontAwesomeIcons.heart,size: 38),
                        onPressed: () {
                          setState(() {
                            click =! click;
                          });
                        })
                    ),
                  ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: CircleAvatar(
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("Yarkın Ata",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                     color: PageColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
               Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                     child:IconButton(
                        icon: click ? Icon(FontAwesomeIcons.solidHeart,size: 38,color: Colors.red,) : Icon(FontAwesomeIcons.heart,size: 38),
                        onPressed: () {
                          setState(() {
                            click =! click;
                          });
                        })
                    ),
                  ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: CircleAvatar(
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("Yarkın Ata",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                     color: PageColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
               Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                     child:IconButton(
                        icon: click ? Icon(FontAwesomeIcons.solidHeart,size: 38,color: Colors.red,) : Icon(FontAwesomeIcons.heart,size: 38),
                        onPressed: () {
                          setState(() {
                            click =! click;
                          });
                        })
                    ),
                  ],
              ),
            ],
          ),
        ),
        drawer: customDrawer(),
    );
  }
}
