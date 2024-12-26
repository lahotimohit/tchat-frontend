import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/home/models/call.dart';
import 'package:tchat_frontend/home/data/calls.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: const Text(
            'Calls',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
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
            _buildCallList(calls
                .where((call) => call.status == CallStatus.missed)
                .toList()),
            _buildCallList(calls
                .where((call) => call.status == CallStatus.outgoing)
                .toList()),
            _buildCallList(calls
                .where((call) => call.status == CallStatus.incoming)
                .toList()),
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
      separatorBuilder: (context, index) => const SizedBox(),
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
          trailing: IconButton(
            icon: Icon(
              call.isVideoCall ? Icons.videocam : Icons.call,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
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
