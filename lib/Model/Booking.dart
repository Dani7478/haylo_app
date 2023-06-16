class Booking {
  int? id;
  int? userId;
  int? providerId;
  int? serviceId;
  String? bookingDate;
  String? bookingTime;
  double? latitude;
  double? longitude;
  String? workingHours;
  String? servicePrice;
  String? priceCurrency;
  String? status;
  String? transactionId;
  String? receiptUrl;
  String? createdAt;
  String? updatedAt;
  UserDetails? userDetails;
  UserDetails? providerDetails;
  ServiceDetails? serviceDetails;

  Booking(
      {this.id,
        this.userId,
        this.providerId,
        this.serviceId,
        this.bookingDate,
        this.bookingTime,
        this.latitude,
        this.longitude,
        this.workingHours,
        this.servicePrice,
        this.priceCurrency,
        this.status,
        this.transactionId,
        this.receiptUrl,
        this.createdAt,
        this.updatedAt,
        this.userDetails,
        this.providerDetails,
        this.serviceDetails});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    workingHours = json['working_hours'];
    servicePrice = json['service_price'];
    priceCurrency = json['price_currency'];
    status = json['status'];
    transactionId = json['transaction_id'];
    receiptUrl = json['receipt_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    providerDetails = json['provider_details'] != null
        ? new UserDetails.fromJson(json['provider_details'])
        : null;
    serviceDetails = json['service_details'] != null
        ? new ServiceDetails.fromJson(json['service_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['provider_id'] = this.providerId;
    data['service_id'] = this.serviceId;
    data['booking_date'] = this.bookingDate;
    data['booking_time'] = this.bookingTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['working_hours'] = this.workingHours;
    data['service_price'] = this.servicePrice;
    data['price_currency'] = this.priceCurrency;
    data['status'] = this.status;
    data['transaction_id'] = this.transactionId;
    data['receipt_url'] = this.receiptUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    if (this.providerDetails != null) {
      data['provider_details'] = this.providerDetails!.toJson();
    }
    if (this.serviceDetails != null) {
      data['service_details'] = this.serviceDetails!.toJson();
    }
    return data;
  }
}

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

class ServiceDetails {
  int? id;
  int? userId;
  String? name;
  String? description;
  int? perHourPrice;
  String? priceCurrency;
  String? image;
  String? createdAt;

  ServiceDetails(
      {this.id,
        this.userId,
        this.name,
        this.description,
        this.perHourPrice,
        this.priceCurrency,
        this.image,
        this.createdAt});

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    perHourPrice = json['per_hour_price'];
    priceCurrency = json['price_currency'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['per_hour_price'] = this.perHourPrice;
    data['price_currency'] = this.priceCurrency;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
