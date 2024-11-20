enum MessageType {
  text,
  image,
  video,
  audio,
  document,
  location,
}

enum MessageStatus {
  sent,
  delivered,
  read,
}

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final bool isSent;
  final MessageType messageType;
  final DateTime timestamp;
  final bool isRead;
  final MessageStatus status;
  final Map<String, dynamic>? metadata;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.isSent,
    this.messageType = MessageType.text,
    required this.timestamp,
    this.isRead = false,
    this.status = MessageStatus.sent,
    this.metadata,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      isSent: json['isSent'] as bool,
      content: json['content'] as String,
      messageType: _messageTypeFromString(json['messageType'] as String),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      status: _messageStatusFromString(json['status'] as String? ?? 'sent'),
      metadata: json['metadata'] != null
          ? Map<String, dynamic>.from(json['metadata'] as Map)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'messageType': _messageTypeToString(messageType),
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'status': _messageStatusToString(status),
      'metadata': metadata,
    };
  }

  static MessageType _messageTypeFromString(String type) {
    switch (type) {
      case 'text':
        return MessageType.text;
      case 'image':
        return MessageType.image;
      case 'video':
        return MessageType.video;
      case 'audio':
        return MessageType.audio;
      case 'document':
        return MessageType.document;
      case 'location':
        return MessageType.location;
      default:
        return MessageType.text;
    }
  }

  static String _messageTypeToString(MessageType type) {
    return type.toString().split('.').last;
  }

  static MessageStatus _messageStatusFromString(String status) {
    switch (status) {
      case 'sent':
        return MessageStatus.sent;
      case 'delivered':
        return MessageStatus.delivered;
      case 'read':
        return MessageStatus.read;
      default:
        return MessageStatus.sent;
    }
  }

  static String _messageStatusToString(MessageStatus status) {
    return status.toString().split('.').last;
  }

  @override
  String toString() {
    return 'Message{id: $id, senderId: $senderId, receiverId: $receiverId, content: $content, messageType: $messageType, timestamp: $timestamp, isRead: $isRead, status: $status, metadata: $metadata}';
  }
}
