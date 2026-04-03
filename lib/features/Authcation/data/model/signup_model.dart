class SignupModel {
	String? details;

	SignupModel({this.details});

	factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
				details: json['details'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'details': details,
			};
}
