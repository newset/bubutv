import 'package:dio/dio.dart';

const String _baseURL = "https://api.cupfox.app/api/v2";

const String token = 'f753bfc8d376864dd69b1eeae9a53429866424fa';

Dio dio = Dio(
  BaseOptions(
    baseUrl: _baseURL,
    connectTimeout: 5000,
    queryParameters: {
      'token': token,
    },
  ),
);

class Urls {
  static const recommend =
      '/recommend/?subject=tv_%E7%83%AD%E9%97%A8&page_start=0&page_limit=24';

  static const tv = '/tv/?';
  static const movie = '/tv/?';
  static const comic = '/tv/?';
  static const show = '/tv/?';
}
