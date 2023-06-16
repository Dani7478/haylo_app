class Service {
  String? id;
  String? category_name;
  String? category_image;

  Service({this.id, this.category_name, this.category_image});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    category_name = json['category_name']?.toString();
    category_image = json['category_image']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.category_name;
    data['category_image'] = this.category_image;
    return data;
  }
}

