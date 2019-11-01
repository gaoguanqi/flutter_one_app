import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/pages/splash_page.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    ///设置Android状态栏透明
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.transparent,
//        statusBarBrightness: Brightness.dark));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
   }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ONE·一个',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: SplashPage());
    ;
  }
}
