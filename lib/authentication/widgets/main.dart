import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tchat_frontend/authentication/api/login.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/home/screen/main.dart';

class ItemAuth extends StatefulWidget {
  const ItemAuth({super.key});

  @override
  State<ItemAuth> createState() => _ItemAuthState();
}

class _ItemAuthState extends State<ItemAuth> {
  bool isLogin = false;

  void _onLogin() async {
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
      final Map<String, dynamic> result = await api.dioLogin(
          _emailController.text.trim(), _passwordController.text.trim());

      setState(() {
        isLogin = false;
      });
      Navigator.of(context).pop();

      if (result['code'] == 401) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result['error'])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result['msg'])));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const HomeMainScreen()),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      setState(() {
        isLogin = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

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
                labelText: "Email Address",
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      _onLogin();
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
