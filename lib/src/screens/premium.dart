import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class PremiumBusinessScreen extends StatelessWidget {
  const PremiumBusinessScreen({super.key, required this.isPremium});
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const CustomText(
                  text: "Plan Details",
                  size: 24,
                  weight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Rs. 99",
                                    style: const TextStyle(
                                      fontSize: 28,
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
                              text: "Rs.10 /month",
                              size: 14,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          text: "Premium Plan",
                          size: 20,
                          weight: FontWeight.w500,
                        ),
                        const CustomText(
                          text:
                              "Enjoy complete access to TChatApp features for a full year",
                          size: 12,
                          color: grey,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomText(
                          text: "This plan gets",
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...[
                          "Priority Support",
                          "Video calls for hours",
                          "Voice messages from anywhere",
                          "Unlimited Users",
                        ].map(
                          (feature) => Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: grey,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              CustomText(
                                text: feature,
                                size: 12,
                                color: grey,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      CustomText(
                        size: 14,
                        weight: FontWeight.w500,
                        text: "Payment Methods",
                        color: grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://paytmblogcdn.paytm.com/wp-content/uploads/2023/03/Paym-Logo.jpg"),
                              ),
                              title: CustomText(
                                text: "Credit Card ***789",
                                size: 12,
                              ),
                              subtitle: CustomText(
                                text: "Expires 12/27",
                                size: 10,
                                color: grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Radio<int>(
                              value: 0,
                              groupValue: 0,
                              onChanged: (value) {
                                // setState(() {
                                //   selectedMethod = value!;
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://paytmblogcdn.paytm.com/wp-content/uploads/2023/03/Paym-Logo.jpg"),
                              ),
                              title: CustomText(
                                text: "Paytm",
                                size: 12,
                              ),
                              subtitle: CustomText(
                                text: "abcdefgh@upi",
                                size: 10,
                                color: grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Radio<int>(
                              value: 0,
                              groupValue: 0,
                              onChanged: (value) {
                                // setState(() {
                                //   selectedMethod = value!;
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://paytmblogcdn.paytm.com/wp-content/uploads/2023/03/Paym-Logo.jpg"),
                              ),
                              title: CustomText(
                                text: "Google Pay",
                                size: 12,
                              ),
                              subtitle: CustomText(
                                text: "XXXX792483",
                                size: 10,
                                color: grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Radio<int>(
                              value: 0,
                              groupValue: 0,
                              onChanged: (value) {
                                // setState(() {
                                //   selectedMethod = value!;
                                // });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Button Pressed");
                  },
                  style: customElevatedButton(),
                  child: const CustomText(
                    alignment: Alignment.center,
                    text: "Pay Now",
                    color: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
