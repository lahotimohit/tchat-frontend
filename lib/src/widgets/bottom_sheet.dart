import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetContent extends StatelessWidget {
  final Function(ImageSource) onImageSelected;

  const BottomSheetContent({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Select Picture From',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Use camera or select file from device gallery',
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt, size: 30, color: Theme.of(context).colorScheme.primary),
                    onPressed: () => onImageSelected(ImageSource.camera),
                  ),
                  Text("Camera",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),)
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.photo, size: 30, color: Theme.of(context).colorScheme.primary),
                    onPressed: () => onImageSelected(ImageSource.gallery),
                  ),
                  Text("Gallery",
                  style: TextStyle(color: Theme.of(context).primaryColor),)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
