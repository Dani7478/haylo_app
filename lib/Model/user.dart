class User {
  String? id;
  String? facebookId;
  String? googleId;
  String? appleId;
  String? categoryId;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? profileImage;
  String? phone;
  String? uniqueSkills;
  String? uniquePitch;
  String? gender;
  String? nationality;
  String? state;
  String? city;
  String? address;
  String? postalCode;
  String? nationalIdSsn;
  String? bankAccountHolderName;
  String? bankName;
  String? routingNumber;
  String? bankAccountNumber;
  String? incorporationDate;
  String? averageRating;
  String? deviceType;
  String? fcmToken;
  String? type;
  String? isVerified;

  User(
      {this.id,
      this.facebookId,
      this.googleId,
      this.appleId,
      this.categoryId,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.profileImage,
      this.phone,
      this.uniqueSkills,
      this.uniquePitch,
      this.gender,
      this.nationality,
      this.state,
      this.city,
      this.address,
      this.postalCode,
      this.nationalIdSsn,
      this.bankAccountHolderName,
      this.bankName,
      this.routingNumber,
      this.bankAccountNumber,
      this.incorporationDate,
      this.averageRating,
      this.deviceType,
      this.fcmToken,
      this.type,
      this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    facebookId = json['facebook_id'].toString();
    googleId = json['google_id'].toString();
    appleId = json['apple_id'].toString();
    categoryId = json['category_id'].toString();
    firstName = json['first_name'].toString();
    lastName = json['last_name'].toString();
    email = json['email'].toString();
    emailVerifiedAt = json['email_verified_at'].toString();
    profileImage = json['profile_image'].toString();
    phone = json['phone'].toString();
    uniqueSkills = json['unique_skills'].toString();
    uniquePitch = json['unique_pitch'].toString();
    gender = json['gender'].toString();
    nationality = json['nationality'].toString();
    state = json['state'].toString();
    city = json['city'].toString();
    address = json['address'].toString();
    postalCode = json['postal_code'].toString();
    nationalIdSsn = json['national_id_ssn'].toString();
    bankAccountHolderName = json['bank_account_holder_name'].toString();
    bankName = json['bank_name'].toString();
    routingNumber = json['routing_number'].toString();
    bankAccountNumber = json['bank_account_number'].toString();
    incorporationDate = json['incorporation_date'].toString();
    averageRating = json['average_rating'].toString();
    deviceType = json['device_type'].toString();
    fcmToken = json['fcm_token'].toString();
    type = json['type'].toString();
    isVerified = json['is_verified'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['apple_id'] = this.appleId;
    data['category_id'] = this.categoryId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_image'] = this.profileImage;
    data['phone'] = this.phone;
    data['unique_skills'] = this.uniqueSkills;
    data['unique_pitch'] = this.uniquePitch;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['national_id_ssn'] = this.nationalIdSsn;
    data['bank_account_holder_name'] = this.bankAccountHolderName;
    data['bank_name'] = this.bankName;
    data['routing_number'] = this.routingNumber;
    data['bank_account_number'] = this.bankAccountNumber;
    data['incorporation_date'] = this.incorporationDate;
    data['average_rating'] = this.averageRating;
    data['device_type'] = this.deviceType;
    data['fcm_token'] = this.fcmToken;
    data['type'] = this.type;
    data['is_verified'] = this.isVerified;
    return data;
  }
}
