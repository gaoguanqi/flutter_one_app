import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_one_app/app/global/refresh_helper.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}


class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ONE IS ALL',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            onPressed: ()=> onClickSearch(),
          )
        ],
      ),
      body: Container(
        color: Color(0xFFF4F4F4),
        child: EasyRefresh.custom(
        header: RefreshHelper.defaultHeader(),
        footer: RefreshHelper.defaultFooter(),
        ),
      ),
    );
  }

  onClickSearch() {

  }
}

