import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PhoneNumberMainScreen extends StatefulWidget {
  const PhoneNumberMainScreen({super.key});

  @override
  State<PhoneNumberMainScreen> createState() => _PhoneNumberMainScreenState();
}

class _PhoneNumberMainScreenState extends State<PhoneNumberMainScreen> {
  int currentPage = 1;
  List<bool> selectedNumbers = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value:
                0.33,
            backgroundColor: Colors.grey[300],
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Generated Phone Numbers",
              style: GoogleFonts.poppins(
                  fontSize: 21, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              "Choose any one phone number to be activated for now.",
              style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        if (index < 5) {
                          int mobileNumberIndex = (currentPage - 1) * 5 + index;
                          return Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              title: Text("4568723170"),
                              trailing: Switch(
                                value: selectedNumbers[mobileNumberIndex],
                                onChanged: (bool newValue) {
                                  setState(() {
                                    for (int i = 0;
                                        i < selectedNumbers.length;
                                        i++) {
                                      selectedNumbers[i] = false;
                                    }
                                    selectedNumbers[mobileNumberIndex] =
                                        newValue;
                                  });
                                },
                                activeColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                activeTrackColor: Theme.of(context).colorScheme.primary,
                                inactiveTrackColor:
                                    const Color.fromARGB(100, 62, 102, 197),
                                inactiveThumbColor: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left Arrow
                                IconButton.outlined(
                                  icon: const Icon(Icons.arrow_left_rounded),
                                  onPressed: currentPage == 1
                                      ? null
                                      : () {
                                          setState(() {
                                            currentPage = 1;
                                          });
                                        },
                                ),
                                Text(
                                  "$currentPage of 2",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton.outlined(
                                  icon: const Icon(Icons.arrow_right_rounded),
                                  onPressed: currentPage == 2
                                      ? null
                                      : () {
                                          setState(() {
                                            currentPage = 2;
                                          });
                                        },
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}