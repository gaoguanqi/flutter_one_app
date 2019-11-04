import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  String _title = 'title';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black45,
                  size: 18.0,
                ),
                onPressed: () => onClickSetting()),
            Expanded(
              child: Center(
                child: Text(
                  '$_title',
                  style: TextStyle(
                      color: Colors.black45, fontSize: 16.0, letterSpacing: 2.0),
                ),
              ),
              flex: 1,
            ),
            IconButton(
                icon: Icon(
                  Icons.email,
                  color: Colors.black45,
                  size: 18.0,
                ),
                onPressed: () => onClickEmail()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Container(),
    );
  }

  onClickSetting() {

  }

  onClickEmail() {

  }
}
