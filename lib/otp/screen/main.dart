import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/numbers/screens/main.dart';

class OtpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.surface,), onPressed: () {
          Navigator.of(context).pop();
        },)),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text("Verification Code",
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 26,
                ),
                ),
                Text(
                  'We have sent an OTP to your registered mobile number.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[300]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.surface),
                        decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey), // Default border color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.surface), // Enabled border color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.surface), // Focused border color
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => PhoneNumberMainScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text('Verify OTP', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
        ),
      ),
    );
  }
}