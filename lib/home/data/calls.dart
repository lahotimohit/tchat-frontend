import 'package:tchat_frontend/home/models/call.dart';

final List<Call> calls = [
    Call(
      name: "Frank Martin",
      timestamp: "10 minutes ago",
      profileImage:
          "https://images.unsplash.com/photo-1624140716840-5d89f311f500?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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