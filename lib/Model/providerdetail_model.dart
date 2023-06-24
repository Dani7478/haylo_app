class ProviderDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  int? averageRating;

  ProviderDetails(
      {this.id,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.averageRating});

  ProviderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'].toString();
    profileImage = json['profile_image'].toString();
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['average_rating'] = this.averageRating;
    return data;
  }
}
