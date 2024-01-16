import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? fullName;
  String? email;
  DateTime? birthdate;
  String? biography;
  List<String>? hobbies;

  UserModel(
      {this.fullName,
      this.email,
      this.birthdate,
      this.biography,
      this.hobbies});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    birthdate = json['birthdate'];
    biography = json['biography'];
    if (json["hobbies"] != null) {
      hobbies = [];
      json["hobbies"].forEach((e) {
        hobbies!.add(e);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['birthdate'] = this.birthdate;
    data['biography'] = this.biography;
    return data;
  }
}
