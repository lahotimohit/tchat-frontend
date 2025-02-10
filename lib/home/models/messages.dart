class Message {
  final String username;
  final String lastMessage;
  final String timestamp;
  final bool? isPin;
  final bool? isMute;
  final int? unread;
  final String profileImage;

  Message({
    required this.username,
    required this.lastMessage,
    required this.timestamp,
    this.isMute,
    this.isPin,
    this.unread,
    required this.profileImage,
  });
}