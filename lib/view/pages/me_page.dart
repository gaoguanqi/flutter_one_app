import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one_app/app/config/resource_mananger.dart';

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
                      color: Colors.black45,
                      fontSize: 16.0,
                      letterSpacing: 2.0),
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
      body: _buildKnow()
    );
  }

  onClickSetting() {}

  onClickEmail() {}

  Widget _buildKnow() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(ImageHelper.wrapAssets('bg_one_logo.jpg')),
            ClipOval(
              child: Container(
                color: Colors.black87,
                width: 92.0,
                height: 92.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '登录',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    Text(
                      'ONE一个',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text('还没有账号？点击注册',style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),),

            Text('sssssss')
          ],
        ),
      ),
    );
  }

  Widget _buildUsed() {
    return Text('已登录');
  }
}
