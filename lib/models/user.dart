class User {
  String name;
  String email;
  String password;
  String phone;
  String location_id;
  User({required this.name, required this.email, required this.password,required this.phone,required this.location_id});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
        phone: json['phone'],
        location_id: json['location_id']
    );
  }
}

class UserCredential {
  String email;
  String password;
  UserCredential({required this.email, required this.password});

  factory UserCredential.fromJson(Map<String, dynamic> json) {
    return UserCredential(

        email: json['email'],
        password: json['password'],

    );
  }
}
