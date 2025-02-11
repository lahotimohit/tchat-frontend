class Community {
  String name;
  String? profileImage;
  List<Group> groups;

  Community({required this.name, required this.groups, this.profileImage});

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      name: json['name'],
      profileImage: json['profileImage'],
      groups: (json['groups'] as List).map((g) => Group.fromJson(g)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profileImage': profileImage,
      'groups': groups.map((g) => g.toJson()).toList(),
    };
  }
}

class Group {
  String groupName;
  String lastMessage;
  String? groupImage;
  String lastMessageTimestamp;
  bool? isPin;
  bool? isMute;
  int? unread;
  int unreadCount;

  Group({
    required this.groupName,
    required this.lastMessage,
    this.isMute,
    this.isPin,
    this.unread,
    this.groupImage,
    required this.lastMessageTimestamp,
    required this.unreadCount,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupName: json['groupName'],
      lastMessage: json['lastMessage'],
      groupImage: json['groupImage'],
      isPin: json['isPin'],
      isMute: json['isMute'],
      unread: json['unread'],
      lastMessageTimestamp: json['lastMessageTimestamp'],
      unreadCount: json['unreadCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'lastMessage': lastMessage,
      'groupImage': groupImage,
      'lastMessageTimestamp': lastMessageTimestamp,
      'isPin': isPin,
      'isMute': isMute,
      'unread': unread,
      'unreadCount': unreadCount,
    };
  }
}
