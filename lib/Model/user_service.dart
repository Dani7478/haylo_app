class UserService {
  String? id;
  String? userId;
  String? name;
  String? description;
  String? perHourPrice;
  String? priceCurrency;
  String? image;
  String? createdAt;

  UserService(
      {this.id,
        this.userId,
        this.name,
        this.description,
        this.perHourPrice,
        this.priceCurrency,
        this.image,
        this.createdAt});

  UserService.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    name = json['name'].toString();
    description = json['description'].toString();
    perHourPrice = json['per_hour_price'].toString();
    priceCurrency = json['price_currency'].toString();
    image = json['image'].toString();
    createdAt = json['created_at'].toString();
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
