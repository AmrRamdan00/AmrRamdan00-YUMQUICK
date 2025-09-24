class UserModel {
  final String userEmail;
  final String password;
  final String usercode;

  UserModel({
    required this.userEmail,
    required this.password,
    required this.usercode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userEmail: json['userEmail'] ?? '',
      password: json['password'] ?? '',
      usercode: json['usercode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'userEmail': userEmail, 'password': password, 'usercode': usercode};
  }
}
