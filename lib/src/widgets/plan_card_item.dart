import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardItem(
  BuildContext context,
  int? selectedPlan,
  int planId,
  String title,
  String subtitle,
  String yearPrice,
  String monthPrice, {
  required ValueChanged<int?> onSelect,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        RadioListTile(
          value: planId,
          groupValue: selectedPlan,
          onChanged: onSelect,
          subtitle: Column(
            children: [
              CustomText(
                text: subtitle,
                size: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(color: Colors.black),
                      children: [
                        TextSpan(
                          text: yearPrice,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: "/year",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomText(
                    text: "Rs.${monthPrice} /month",
                    size: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          title: CustomText(
            text: title,
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
