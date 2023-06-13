import 'dart:io';

class User {
  String? signupAs;
  String? firstName;
  String? lastName;
  String? email;
  File? image;
  String? password;

  User(
      {this.signupAs,
      this.firstName,
      this.lastName,
      this.email,
      this.image,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    signupAs = json['signup_as'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    image = json['image'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signup_as'] = this.signupAs;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['image'] = this.image;
    data['password'] = this.password;
    return data;
  }
}
