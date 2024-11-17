import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    required this.status,
  });
}

enum CallStatus {
  missed,
  outgoing,
  incoming,
}

class CallScreen extends StatelessWidget {
  CallScreen({super.key});

  final List<Call> calls = [
    Call(
      name: "Thala",
      timestamp: "10 minutes ago",
      profileImage:
          "https://images.firstpost.com/uploads/2024/02/MS-Dhoni-CSK-IPL-2023-PTI-1200-2024-02-9c8c7d515e57c707fd33cef140b5d687.jpg?im=FitAndFill=(1200,675)",
      isVideoCall: true,
      status: CallStatus.missed,
    ),
    Call(
      name: "Chokli",
      timestamp: "Today, 2:30 PM",
      profileImage:
          "https://www.hindustantimes.com/static-content/1y/cricket-logos/players/virat-kohli.png",
      isVideoCall: false,
      status: CallStatus.outgoing,
    ),
    // Add more call records as needed
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Calls',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'clear',
                  child: Text('Clear call log'),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('Settings'),
                ),
              ],
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Missed'),
              Tab(text: 'Outgoing'),
              Tab(text: 'Incoming'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCallList(calls),
            _buildCallList(calls.where((call) => call.status == CallStatus.missed).toList()),
            _buildCallList(calls.where((call) => call.status == CallStatus.outgoing).toList()),
            _buildCallList(calls.where((call) => call.status == CallStatus.incoming).toList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {},
          child: const Icon(Icons.add_call, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCallList(List<Call> calls) {
    return ListView.separated(
      itemCount: calls.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final call = calls[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(call.profileImage),
          ),
          title: Text(
            call.name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                _getCallStatusIcon(call.status),
                size: 15,
                color: _getCallStatusColor(call.status),
              ),
              const SizedBox(width: 5),
              Text(
                call.timestamp,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  call.isVideoCall ? Icons.videocam : Icons.call,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.info_outline,
                color: Colors.grey[400],
                size: 20,
              ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }

  IconData _getCallStatusIcon(CallStatus status) {
    switch (status) {
      case CallStatus.missed:
        return Icons.call_missed;
      case CallStatus.outgoing:
        return Icons.call_made;
      case CallStatus.incoming:
        return Icons.call_received;
    }
  }

  Color _getCallStatusColor(CallStatus status) {
    switch (status) {
      case CallStatus.missed:
        return Colors.red;
      case CallStatus.outgoing:
        return Colors.green;
      case CallStatus.incoming:
        return Colors.green;
    }
  }
}

// Empty Call List Widget
class EmptyCallList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_missed,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          Text(
            'No calls yet',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Start calling your friends and family',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}