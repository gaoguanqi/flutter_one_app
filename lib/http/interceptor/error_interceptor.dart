import 'dart:async';

import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {

  @override
  Future onError(DioError err) {
//    print(err.type);//也可以区分类型，自定义message;
//    if(null != err.response) {
//      err.message = "网络错误请稍后重试(" + err.response.statusCode.toString() + ")";
//    } else if(null != err.request) {
//      err.message = "网络异常，请检查网络情况";
//    }


    return super.onError(err);
  }
}