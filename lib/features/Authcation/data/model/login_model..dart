class LoginModel {
	String? refresh;
	String? access;

	LoginModel({this.refresh, this.access});

	factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
				refresh: json['refresh'] as String?,
				access: json['access'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'refresh': refresh,
				'access': access,
			};
}
