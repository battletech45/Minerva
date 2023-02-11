import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.deepOrange[300],
        ),
        backgroundColor: Colors.deepOrange[300],
        body: Center(
          child: Column(

            children: <Widget> [
              Align(
                alignment: Alignment.topRight,
                child:SizedBox(
                  child:Image.asset('assets/logo.png') ,

                  height: 150,
                  width: 150,
                ),
              )

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
        )
    );
  }
}
