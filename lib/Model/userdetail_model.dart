class UserDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  int? averageRating;
  int? type;

  UserDetails(
      {this.id,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.averageRating,
        this.type});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    averageRating = json['average_rating'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['average_rating'] = this.averageRating;
    data['type'] = this.type;
    return data;
  }
}