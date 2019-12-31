import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_one_app/http/http_method.dart';

import 'error/http_exception.dart';

const String HOST = "";

const int CONNECT_TIMEOUT = 30000;
const int RECEIVE_TIMEOUT = 3000;
final ContentType CONTENT_TYPE = ContentType.json;

typedef ErrorCallback = void Function(int count, String msg);

class HttpUtil {
  factory HttpUtil() => _httpInstance();
  static HttpUtil _instance;
  Dio _dio;
  BaseOptions _options;

  static HttpUtil _httpInstance() {
    if (_instance == null) {
      _instance = HttpUtil._init();
    }
    return _instance;
  }

  HttpUtil._init() {
    _options = BaseOptions(
      //请求的Content-Type
        contentType: Headers.jsonContentType,
        //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: {
          //do something
          "version": "1.0.0"
        },
        baseUrl: HOST);
    _dio = Dio(_options);
    //Cookie管理
//    _dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }

  //拦截器添加
  addInterceptor(Interceptor interceptor) {
    if (null != _dio) {
      _dio.interceptors.add(interceptor);
    }
  }

  addInterceptors(List<Interceptor> interceptorList) {
    if (null != _dio) {
      _dio.interceptors.addAll(interceptorList);
    }
  }

  /*
   * get请求
   */
  Future<dynamic>get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');
//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response;
  }


  /*
   * post请求
   */
  Future<dynamic>post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * 下载文件
   */
  Future<dynamic>downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
            //进度
            print("$count $total");
          });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

/*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }



  Future<dynamic> request(String path, HttpMethod mode, postData) async {
    try {} on DioError catch (exception) {
      return Future.error(
          HttpIOException(exception.response.statusCode, exception.message));
    } catch (error) {
      return Future.error(HttpIOException(-2, error.toString()));
    }
    return Future.error(HttpIOException(-1, "not supported"));
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
