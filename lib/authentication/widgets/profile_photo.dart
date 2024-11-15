import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePhoto extends StatelessWidget {
  final File? image;
  final VoidCallback onPressed;

  const ProfilePhoto({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
          ),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: image != null ? FileImage(image!) : null,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: image == null
                ? Icon(
                    Icons.person_rounded,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Theme.of(context).colorScheme.surface,
                size: 20,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
