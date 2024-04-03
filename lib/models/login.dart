
class Login {

  String accessToken;
  String refreshToken;

	Login.fromJsonMap(Map<String, dynamic> map): 
		accessToken = map["access_token"],
		refreshToken = map["refresh_token"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['access_token'] = accessToken;
		data['refresh_token'] = refreshToken;
		return data;
	}
}
