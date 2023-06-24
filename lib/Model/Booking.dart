import 'package:haylo_app/Model/service_detail.dart';
import 'package:haylo_app/Model/userdetail_model.dart';

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
  int? immediatly;
  String? startedAt;
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
        this.serviceDetails,
        this.immediatly,
        this.startedAt
      });

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
    immediatly=json['immediatly'];
    startedAt=json['started_at'];
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
    data['immediatly']=this.immediatly;
    data['started_at']=this.startedAt;
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




