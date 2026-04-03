class RequestSignin {
  final String email;
  final String first_name;
  final String last_name;
  final String password;

  RequestSignin({
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "password": password,
    };
  }

  
}