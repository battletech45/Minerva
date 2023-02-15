import 'package:flutter/material.dart';

import '../Model/CustomWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
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
        drawer: customDrawer(),
    );
  }
}
