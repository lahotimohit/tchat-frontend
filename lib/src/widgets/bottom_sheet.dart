import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

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
          const CustomText(text: "Select Picture From", weight: FontWeight.w500, alignment: Alignment.center,),
          const SizedBox(height: 8),
          const CustomText(text: "Use camera or select files from device gallery", size: 14, weight: FontWeight.w300, alignment: Alignment.center,),
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
                  CustomText(text: "Camera", color: Theme.of(context).colorScheme.primary, size: 14,)
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.photo, size: 30, color: Theme.of(context).colorScheme.primary),
                    onPressed: () => onImageSelected(ImageSource.gallery),
                  ),
                  CustomText(text: "Gallery", color: Theme.of(context).colorScheme.primary, size: 14,)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
