import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Text(
              '01',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -1.0
              ),
            ),
           Padding(
            padding: EdgeInsets.fromLTRB(2.0, 12.0, 2.0, 0),
             child:  Text(
               'Nov.2019',
               style: TextStyle(
                   fontSize: 12.0,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                   letterSpacing: 0.5
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
