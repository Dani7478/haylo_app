class Messages {
  int? id;
  int? fromId;
  int? toId;
  String? text;
  String? messageType;
  String? media;
  String? mediaType;
  String? createdAt;
  int? seen;
  String? createdTime;
  OtherUser? otherUser;

  Messages(
      {this.id,
        this.fromId,
        this.toId,
        this.text,
        this.messageType,
        this.media,
        this.mediaType,
        this.createdAt,
        this.seen,
        this.createdTime,
        this.otherUser});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromId = json['from_id'];
    toId = json['to_id'];
    text = json['text'];
    messageType = json['message_type'];
    media = json['media'];
    mediaType = json['media_type'];
    createdAt = json['created_at'];
    seen = json['seen'];
    createdTime = json['created_time'];
    otherUser = json['other_user'] != null
        ? new OtherUser.fromJson(json['other_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_id'] = this.fromId;
    data['to_id'] = this.toId;
    data['text'] = this.text;
    data['message_type'] = this.messageType;
    data['media'] = this.media;
    data['media_type'] = this.mediaType;
    data['created_at'] = this.createdAt;
    data['seen'] = this.seen;
    data['created_time'] = this.createdTime;
    if (this.otherUser != null) {
      data['other_user'] = this.otherUser!.toJson();
    }
    return data;
  }
}

class OtherUser {
  int? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  int? phone;
  int? type;

  OtherUser(
      {this.id,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.phone,
        this.type});

  OtherUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    phone = json['phone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['phone'] = this.phone;
    data['type'] = this.type;
    return data;
  }
}
