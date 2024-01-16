class UserDetailsModel {
  final String name;
  final String email;
  UserDetailsModel({required this.name, required this.email});

  Map<String, dynamic> getJson() => {
        'name': name,
        'email': email,
      };

  factory UserDetailsModel.getModelFromJson(Map<String, dynamic> json) {
    return UserDetailsModel(name: json["fullname"], email: json["email"]);
  }
}
