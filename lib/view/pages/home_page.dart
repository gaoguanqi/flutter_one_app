import 'package:flutter/material.dart';
import 'package:flutter_one_app/app/config/resource_mananger.dart';
import 'package:flutter_one_app/view/pages/all_page.dart';
import 'package:flutter_one_app/view/pages/me_page.dart';
import 'package:flutter_one_app/view/pages/one_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

final double _fontSize = 10.0;
final double _iconSize = 22.0;

class _HomePageState extends State<HomePage> {
  final _tabTextStyleNormal = TextStyle(
      color: Colors.black45, fontWeight: FontWeight.bold, fontSize: _fontSize);
  final _tabTextStyleSelected = TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: _fontSize);

  final _tabTitles = ['ONE', 'ALL', 'ME'];
  int _tabIndex = 0;
  var _tabImages;
  var _tabPages;

  @override
  void initState() {
    super.initState();

    _tabImages = [
      [_getTabImage('ic_one_normal.png'), _getTabImage('ic_one_selected.png')],
      [_getTabImage('ic_all_normal.png'), _getTabImage('ic_all_selected.png')],
      [_getTabImage('ic_me_normal.png'), _getTabImage('ic_me_selected.png')]
    ];

    _tabPages = [OnePage(), AllPage(), MePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: _getTabIcon(0), title: _getTabTitle(0)),
          BottomNavigationBarItem(icon: _getTabIcon(1), title: _getTabTitle(1)),
          BottomNavigationBarItem(icon: _getTabIcon(2), title: _getTabTitle(2))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        selectedFontSize: _fontSize,
        unselectedFontSize: _fontSize,
        iconSize: _iconSize,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image _getTabImage(String path) => Image.asset(ImageHelper.wrapAssets(path),
      width: _iconSize, height: _iconSize);

  Image _getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabImages[index][1];
    } else {
      return _tabImages[index][0];
    }
  }

  Widget _getTabTitle(int index) {
    if (index == _tabIndex) {
      return Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: Text(_tabTitles[index], style: _tabTextStyleSelected),
      );
    } else {
      return Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Text(_tabTitles[index], style: _tabTextStyleNormal));
    }
  }
}
