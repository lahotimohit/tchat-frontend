import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/screens/premium.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/widgets/plan_card_item.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({super.key});
  @override
  State<ChoosePlanScreen> createState() {
    return _ChoosePlanScreenState();
  }
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  int? selectedPlan;

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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const CustomText(
                text: "Choose the Plan that's right for you",
                size: 24,
                weight: FontWeight.w600,
              ),
              const SizedBox(
                height: 35,
              ),
              cardItem(
                context,
                selectedPlan,
                0,
                "Free Plan",
                "Enjoy complete access to TChat App features for a full year",
                "Rs. 0",
                "0",
                onSelect: (value) {
                  setState(() {
                    selectedPlan = value!;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              cardItem(
                context,
                selectedPlan,
                1,
                "Premium Plan",
                "Enjoy complete access to TChat App features for a full year",
                "Rs. 99",
                "15",
                onSelect: (value) {
                  setState(() {
                    selectedPlan = value!;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              cardItem(
                context,
                selectedPlan,
                2, // Plan ID
                "Business Plan",
                "Enjoy complete access to TChat App features for a full year",
                "Rs. 199",
                "20",
                onSelect: (value) {
                  setState(() {
                    selectedPlan = value!;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedPlan == null) {
                    snackmessage(
                        context, "Please select a plan before continuing");
                  } else {
                    if (selectedPlan == 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) =>
                              const PremiumBusinessScreen(isPremium: false)));
                    }
                    print("Selected Plan ID: $selectedPlan");
                  }
                },
                style: customElevatedButton(),
                child: const CustomText(
                  alignment: Alignment.center,
                  text: "Continue",
                  color: Colors.white,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
