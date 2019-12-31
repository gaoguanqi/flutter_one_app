import 'dart:math';

import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  bool _expand = false;



  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text(
                    '01',
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: -1.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.0, 12.0, 2.0, 0),
                    child: Text(
                      'Nov.2019',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: -0.5),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(2.0, 12.0, 2.0, 0),
                      child: RotationTransition(
                        child: Icon(
                          Icons.network_cell,
                          size: 6.0,
                        ),
                        turns: _animation,
                      )),
                ],
              ),
              onTap: () => onClickDate(),
            ),
            Spacer(),
            Text(
              '上海·多云 20°C',
              style: TextStyle(fontSize: 12.0, color: Colors.black45),
            )
          ],
        ),
      ),
      body: ListView(

      ),
    );
  }

  onClickDate() {
    setState(() {
    _expand = !_expand;
    });
    if(_expand){
      _animationController.forward();
    }else{
      _animationController.reverse();
    }
  }

  void initAnimation() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 200,
        ));
    _animation = Tween(begin: 0.0, end: 0.5).animate(_animationController);
  }

}
