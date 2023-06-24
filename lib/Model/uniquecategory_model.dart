import 'package:haylo_app/Model/service.dart';

class UniqueCategoryModel {
  int? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? uniqueSkills;
  int? averageRating;
  String? minPrice;
  List<Services>? services;

  UniqueCategoryModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.uniqueSkills,
        this.averageRating,
        this.minPrice,
        this.services});

  UniqueCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'].toString();
    lastName = json['last_name'].toString();
    profileImage = json['profile_image'];
    uniqueSkills = json['unique_skills'];
    averageRating = json['average_rating'];
    minPrice = json['min_price'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['unique_skills'] = this.uniqueSkills;
    data['average_rating'] = this.averageRating;
    data['min_price'] = this.minPrice;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


