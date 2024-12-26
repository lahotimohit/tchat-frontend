import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tchat_frontend/api/login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tchat_frontend/authentication/widgets/snackmessage.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/authentication/validators/auth.dart';
import 'package:tchat_frontend/home/screen/dashboard.dart';
import 'package:tchat_frontend/otp/screen/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  final TextEditingController _emailController = TextEditingController();
  void _onLogin(BuildContext context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (Ctx) => const HomeMainScreen()));
    // String email = _emailController.text.trim();
    // String response = emailValidate(email);
    // var connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult[0] == ConnectivityResult.none) {
    //   snackmessage(context, "Please check your internet connection");
    //   return;
    // } else if (response == "Success") {
    //   setState(() {
    //     isLogin = true;
    //   });
    //   showCupertinoDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );

    //   try {
    //     LoginAPI api = LoginAPI();
    //     final Map<String, dynamic> result = await api.dioLogin(email);
    //     setState(() {
    //       isLogin = false;
    //     });
    //     Navigator.of(context).pop();

    //     if (result['code'] == 401) {
    //       snackmessage(context, result['error']);
    //     } else {
    //       snackmessage(context, result['msg']);
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (ctx) => const OtpScreen()));
    //     }
    //   } catch (e) {
    //     setState(() {
    //       isLogin = false;
    //     });
    //     snackmessage(context, "Internal Server Error");
    //   }
    // } else {
    //   snackmessage(context, response);
    //   return;
    // }
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
