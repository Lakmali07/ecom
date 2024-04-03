import 'package:dio/dio.dart';

import '../utils/dio_interceptor.dart';

class DioApi{
  late Dio _dio;

  DioApi(){
    _dio = Dio(BaseOptions(baseUrl: "https://api.escuelajs.co/api/v1/auth/"));
    _dio.interceptors.add(DioInterceptor(_dio));
  }

  // Future<void> saveToken(Map<String,dynamic>data) async{
  //   final accessToken = data['access_token'];
  //   await Store.setToken(accessToken);
  // }

  Future<dynamic> signIn(String userName, String password) async {
    try {
      var response = await _dio.post('login',
        data: {"email": userName, "password": password},
      );
      return response;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }


}