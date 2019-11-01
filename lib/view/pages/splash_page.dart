import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_one_app/app/config/resource_mananger.dart';
import 'package:flutter_one_app/view/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;
  int _count = 1;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_count == 0) {
        _timer.cancel();
        //跳首页
        _goHome();
        return;
      }
      setState(() {
        _count--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            ImageHelper.wrapAssets('splash_image.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            child: Center(
                child: Text('$_count s',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54))),
            decoration:
                BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
            width: 30.0,
            height: 30.0,
          ),
          top: 30.0,
          right: 30.0,
        ),
      ],
    ));
  }

  void _goHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => route == null);
  }
}
