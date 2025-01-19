import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tchat_frontend/api/login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tchat_frontend/authentication/widgets/snackmessage.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/authentication/validators/auth.dart';
import 'package:country_picker/country_picker.dart';
// import 'package:tchat_frontend/home/screen/dashboard.dart';
import 'package:tchat_frontend/otp/screen/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  void _onLogin(BuildContext context) async {
    final String email = _emailController.text.trim();
    final String code = _countryCodeController.text.trim();
    final String phone = _mobileController.text.trim();

    AuthValidation auth = AuthValidation(email, phone, code);
    final String response = auth.validation();

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      snackmessage(context, "Please check your internet connection");
      return;
    } else if (response == "Success") {
      setState(() {
        isLogin = true;
      });
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        print("codeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee: ${code}");
        LoginAPI api = LoginAPI();
        final Map<String, dynamic> result =
            await api.dioLogin(email, code, phone);
        setState(() {
          isLogin = false;
        });
        Navigator.of(context).pop();

        if (result['code'] == 401) {
          snackmessage(context, result['error']);
        } else {
          snackmessage(context, result['msg']);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const OtpScreen()));
        }
      } catch (e) {
        setState(() {
          isLogin = false;
        });
        snackmessage(context, "Internal Server Error");
      }
    } else {
      snackmessage(context, response);
      return;
    }
  }

  String _selectedCountryFlag = "🇺🇸"; // Default flag

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true, // Display phone code alongside the country name
      onSelect: (Country country) {
        setState(() {
          _countryCodeController.text = "+${country.phoneCode}";
          _selectedCountryFlag = country.flagEmoji;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset("assets/images/logo.png",
                        width: 250, height: 250)),
                Text(
                  "Sign In",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWidget(
                    controller: _emailController,
                    labelText: "Enter Your Email",
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: _showCountryPicker, // Show dialog on tap
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(children: [
                              Text(
                                _selectedCountryFlag,
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                _countryCodeController.text,
                                style: TextStyle(fontSize: 16),
                              ),
                            ]))),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.25,
                    //   child: TextFieldWidget(
                    //       controller: _countryCodeController,
                    //       labelText: "Code",
                    //       obscureText: false),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.63,
                      child: TextFieldWidget(
                          controller: _mobileController,
                          labelText: "Mobile Number",
                          obscureText: false),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          _onLogin(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.surface),
                        child: const Text("Log In")),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
