import 'package:dio/dio.dart';

enum HttpMethod {
  get,
  post
}

class HttpManager {
  // dio 单利对象
  static Dio _dioInstance = Dio();
  static Dio _getDioInstance() {
    if (_dioInstance == null) {
      _dioInstance = Dio();
    }
    return _dioInstance;
  }

  // 类方法：get
  static Future<Response?> get(String url, {Map<String, dynamic>? queryParameters,}) async {
    return await HttpManager._sendRequest(HttpMethod.get, url, queryParameters: queryParameters);
  }
  // 类方法：post
  static Future<Response?> post(String url, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    return await HttpManager._sendRequest(HttpMethod.post, url, queryParameters: queryParameters, data: data);
  }
  // 类方法：发送网络请求
  static Future<Response?> _sendRequest(HttpMethod method, String url, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      switch (method) {
        case HttpMethod.get:
          return await HttpManager._getDioInstance().get(url, queryParameters: queryParameters);
        case HttpMethod.post:
          return await HttpManager._getDioInstance().post(url, queryParameters: queryParameters, data: data);
        default:
          throw Exception("未知的网络请求方法!");
      }
    } on DioError catch(e) {
      print(e.message);
    } on Exception catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

}