import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomDio {
  var _client;

  CustomDio() {
    _client = Dio(_options);
  }

  CustomDio.withAuthentication() {
    _client = Dio(_options);
    _client.interceptors.add(InterceptorsWrapper(
      onError: _onError,
      onRequest: _onRequest,
      onResponse: _onResponse,
    ));
  }

  BaseOptions _options = BaseOptions(
      baseUrl: "http://192.168.1.18:3001",
      connectTimeout: 30000,
      receiveTimeout: 30000);

  Dio get instance => _client;

  _onRequest(RequestOptions options) async {
    //var token = await
  }

  _onResponse(Response e) {}

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      Get.offAllNamed('/');
    }
    return e;
  }
}
