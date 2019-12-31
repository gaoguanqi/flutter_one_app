import 'dart:async';

import 'package:dio/dio.dart';


class HeaderInterceptor extends Interceptor{
  @override
  Future onRequest(RequestOptions options) {
    options.headers.addAll({
      "deviceId":"123444",
      "requestId":"ddfsgg"
    });
    return super.onRequest(options);
  }
}

