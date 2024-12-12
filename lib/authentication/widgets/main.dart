import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tchat_frontend/authentication/api/login.dart';
import 'package:tchat_frontend/authentication/validators/auth.dart';
import 'package:tchat_frontend/authentication/widgets/snackmessage.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/otp/screen/main.dart';

class ItemAuth extends StatefulWidget {
  const ItemAuth({super.key});

  @override
  State<ItemAuth> createState() => _ItemAuthState();
}

class _ItemAuthState extends State<ItemAuth> {
  bool isLogin = false;
  final GlobalKey<_ItemAuthState> mywidgetKey = GlobalKey();

  void _onLogin(BuildContext context) async {
    String email = _emailController.text.trim();
    String response = emailValidate(email);
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
        LoginAPI api = LoginAPI();
        final Map<String, dynamic> result = await api.dioLogin(email);
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

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.surface),
                    child: const Text("Log In")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
