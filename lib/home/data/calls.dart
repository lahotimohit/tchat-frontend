import 'package:tchat_frontend/home/models/call.dart';

final List<Call> calls = [
    Call(
      name: "Frank Martin",
      timestamp: "10 minutes ago",
      profileImage:
          "https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571_960_720.jpg",
      isVideoCall: true,
      status: CallStatus.missed,
    ),
    Call(
      name: "Marta Popaes",
      timestamp: "Today, 2:30 PM",
      profileImage:
          "https://cdn.pixabay.com/photo/2023/01/24/13/23/viet-nam-7741019_1280.jpg",
      isVideoCall: false,
      status: CallStatus.outgoing,
    ),
    Call(name: "Theresa",
     timestamp: "Yesterday",
      profileImage: "https://cdn.pixabay.com/photo/2022/04/30/14/04/woman-7165664_1280.jpg",
       isVideoCall: true,
        status: CallStatus.incoming)
  ];