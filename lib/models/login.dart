
class Login {

  String access_token;
  String refresh_token;

	Login.fromJsonMap(Map<String, dynamic> map): 
		access_token = map["access_token"],
		refresh_token = map["refresh_token"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['access_token'] = access_token;
		data['refresh_token'] = refresh_token;
		return data;
	}
}
