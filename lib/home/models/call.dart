enum CallStatus {
  missed,
  outgoing,
  incoming
}

class Call {
  final String name;
  final String timestamp;
  final String profileImage;
  final bool isVideoCall;
  final CallStatus status;

  Call({
    required this.name,
    required this.timestamp,
    required this.profileImage,
    required this.isVideoCall,
    required this.status
  });
}