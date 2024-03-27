import 'package:shared_preferences/shared_preferences.dart';

class Store{
  const Store._();
  static const String _tokenKey = 'TOKEN';

  static Future<void> setToken(String token) async{
    final preferances = await SharedPreferences.getInstance();
    await preferances.setString(_tokenKey,token);
  }

  static Future<String?> getToken() async{
    final preferances = await SharedPreferences.getInstance();
    return preferances.getString(_tokenKey);
  }
}