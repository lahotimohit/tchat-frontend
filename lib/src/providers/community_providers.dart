import 'package:tchat_frontend/src/models/community.dart';

final List<Community> communities = [
    Community(
      name: "Team TChat",
      profileImage: 'https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571_960_720.jpg',
      groups: [
        Group(
          groupName: "Common GR",
          groupImage: 'https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571_960_720.jpg',
          lastMessage: "Do you have that as well as with",
          lastMessageTimestamp: "now",
          unreadCount: 2,
          isPin: true
        ),
        Group(
          groupName: "Developers",
          lastMessage: "For your information, it was indeed",
          lastMessageTimestamp: "24/01/25",
          unreadCount: 0,
        ),
      ],
    ),
    Community(
      name: "Hackathon 4.0",
      groups: [
        Group(
          groupName: "Participants",
          lastMessage: "For your information it was indeed",
          lastMessageTimestamp: "24/01/25",
          unreadCount: 5,
        ),
        Group(
          groupName: "Volunteers",
          lastMessage: "Do you have that as well as with",
          lastMessageTimestamp: "24/01/25",
          unreadCount: 5,
          isPin: true,
          isMute: true
        ),
      ],
    ),
        Community(
      name: "Team TChat",
      profileImage: 'https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571_960_720.jpg',
      groups: [
        Group(
          groupName: "Common GR",
          groupImage: 'https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571_960_720.jpg',
          lastMessage: "Do you have that as well as with",
          lastMessageTimestamp: "now",
          unreadCount: 2,
          isPin: true
        ),
        Group(
          groupName: "Developers",
          lastMessage: "For your information, it was indeed",
          lastMessageTimestamp: "24/01/25",
          unreadCount: 0,
        ),
      ],
    ),
    Community(
      name: "Hackathon 4.0",
      groups: [
        Group(
          groupName: "Participants",
          lastMessage: "For your information it was indeed",
          lastMessageTimestamp: "24/01/25",
          unreadCount: 5,
        ),
        Group(
          groupName: "Volunteers",
          lastMessage: "Do you have that as well as with",
          lastMessageTimestamp: "24/01/25",
          unreadCount: 5,
          isPin: true,
          isMute: true
        ),
      ],
    ),
  ];