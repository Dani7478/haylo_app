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