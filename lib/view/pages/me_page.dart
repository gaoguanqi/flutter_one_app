import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one_app/app/config/resource_mananger.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  String _title = 'title';

  bool _hasLogin = true;

  @override
  Widget build(BuildContext context) {
    return _hasLogin ? _buildUsed() : _buildKnow();
  }

  onClickSetting() {}

  onClickEmail() {}

  Widget _buildKnow() {
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
                child: Offstage(
                  offstage: !_hasLogin,
                  child: Text(
                    '$_title',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.0,
                        letterSpacing: 2.0),
                  ),
                ),
              ),
              flex: 1,
            ),
            Offstage(
              offstage: !_hasLogin,
              child: IconButton(
                  icon: Icon(
                    Icons.email,
                    color: Colors.black45,
                    size: 18.0,
                  ),
                  onPressed: () => onClickEmail()),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
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
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          Text(
                            'ONE一个',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    '还没有账号？点击注册',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              flex: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  ImageHelper.wrapAssets('ic_weichart.png'),
                  width: 30.0,
                ),
                Image.asset(
                  ImageHelper.wrapAssets('ic_sina.png'),
                  width: 30.0,
                ),
                Image.asset(
                  ImageHelper.wrapAssets('ic_qq.png'),
                  width: 30.0,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              '创建账号即代表您同意用户服务协议',
              style: TextStyle(fontSize: 10.0, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildUsed() {
    return Scaffold(
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 380.0,
            pinned: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.local_post_office,
                  color: Colors.white70,
                ),
              ),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white70,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    ImageHelper.wrapAssets('bg_me_know.png'),
                    fit: BoxFit.cover,
                    height: 480.0,
                  ),
                  Positioned(
                    top: 88.0,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          child: ClipOval(
                              child: Image.asset(
                                ImageHelper.wrapAssets('bg_one_logo.jpg'),
                                fit: BoxFit.cover,
                                width: 66.0,
                                height: 66.0,
                              ),
                          ),
                          onTap: (){
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
