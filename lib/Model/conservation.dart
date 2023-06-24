class Conservation {
  int? id;
  int? fromId;
  int? toId;
  String? text;
  String? media;
  String? mediaType;
  String? createdAt;
  int? seen;
  int? otherUserId;
  String? createdTime;
  String? otherUserName;
  String? otherUserAvatar;
  int? otherUserType;
  int? unreadMessages;

  Conservation(
      {this.id,
        this.fromId,
        this.toId,
        this.text,
        this.media,
        this.mediaType,
        this.createdAt,
        this.seen,
        this.otherUserId,
        this.createdTime,
        this.otherUserName,
        this.otherUserAvatar,
        this.otherUserType,
        this.unreadMessages});

  Conservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromId = json['from_id'];
    toId = json['to_id'];
    text = json['text'];
    media = json['media'];
    mediaType = json['media_type'];
    createdAt = json['created_at'];
    seen = json['seen'];
    otherUserId = json['other_user_id'];
    createdTime = json['created_time'];
    otherUserName = json['other_user_name'];
    otherUserAvatar = json['other_user_avatar'];
    otherUserType = json['other_user_type'];
    unreadMessages = json['unread_messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_id'] = this.fromId;
    data['to_id'] = this.toId;
    data['text'] = this.text;
    data['media'] = this.media;
    data['media_type'] = this.mediaType;
    data['created_at'] = this.createdAt;
    data['seen'] = this.seen;
    data['other_user_id'] = this.otherUserId;
    data['created_time'] = this.createdTime;
    data['other_user_name'] = this.otherUserName;
    data['other_user_avatar'] = this.otherUserAvatar;
    data['other_user_type'] = this.otherUserType;
    data['unread_messages'] = this.unreadMessages;
    return data;
  }
}
