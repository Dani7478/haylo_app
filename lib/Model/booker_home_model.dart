import 'package:haylo_app/Model/providerdetail_model.dart';
import 'package:haylo_app/Model/service.dart';

import 'categories.dart';

class BookerHomeModel {
  List<Categories>? categories;
  List<RecommendedProviders>? recommendedProviders;
  List<Services>? services;

  BookerHomeModel({this.categories, this.recommendedProviders, this.services});

  BookerHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['recommended_providers'] != null) {
      recommendedProviders = <RecommendedProviders>[];
      json['recommended_providers'].forEach((v) {
        recommendedProviders!.add(new RecommendedProviders.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.recommendedProviders != null) {
      data['recommended_providers'] =
          this.recommendedProviders!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedProviders {
  int? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  int? averageRating;
  int? perHourPrice;
  String? priceCurrency;

  RecommendedProviders(
      {this.id,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.averageRating,
      this.perHourPrice,
      this.priceCurrency});

  RecommendedProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'].toString();
    profileImage = json['profile_image'];
    averageRating = json['average_rating'];
    perHourPrice = json['per_hour_price'];
    priceCurrency = json['price_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['average_rating'] = this.averageRating;
    data['per_hour_price'] = this.perHourPrice;
    data['price_currency'] = this.priceCurrency;
    return data;
  }
}
