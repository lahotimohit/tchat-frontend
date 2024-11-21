import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget chatAppBar(
    String username, String status, String profilephoto, BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    leadingWidth: 90,
    leading: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Theme.of(context).colorScheme.surface,),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
          CircleAvatar(
            radius: 16,
            backgroundImage:
                NetworkImage(profilephoto),
          ),
        ],
      ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.surface),
        ),
        Text(
          status,
          style: GoogleFonts.poppins(
              fontSize: 10, color: Colors.white70),
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.videocam, color: Theme.of(context).colorScheme.surface,),
        onPressed: () {},
      ),
      IconButton(
          icon: Icon(Icons.call,  color: Theme.of(context).colorScheme.surface,),
          onPressed: () {}),
      IconButton(
        icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.surface,),
        onPressed: () {},
      ),
      const SizedBox(width: 2),
    ],
  );
}
