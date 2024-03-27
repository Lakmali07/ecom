import 'package:dio/dio.dart';
import 'package:ecom/services/store_data.dart';

import '../utils/dio_interceptor.dart';

class DioApi{
  late Dio _dio;

  DioApi(){
    _dio = Dio(BaseOptions(baseUrl: "https://api.escuelajs.co/api/v1/auth/"));
    _dio.interceptors.add(DioInterceptor(_dio));
  }

  Future<void> saveToken(Map<String,dynamic>data) async{
    final accessToken = data['access_token'];
    await Store.setToken(accessToken);
  }

  Future<bool> signIn(String userName, String password) async {
    bool success = false;
    try {
      var response = await _dio.post('login',
        data: {"email": userName, "password": password},
        // data: {"email": "john@mail.com", "password": "changeme"},
      );
      if(response.statusCode == 201){
        saveToken(response.data);
        success = true;
      }
    } catch (e) {
      print(e.toString());
    }
    return success;
  }
}