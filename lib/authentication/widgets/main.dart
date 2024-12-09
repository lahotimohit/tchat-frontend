import 'package:flutter/material.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/home/screen/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemAuth extends StatefulWidget {
  const ItemAuth({super.key});

  @override
  State<ItemAuth> createState() => _ItemAuthState();
}

class _ItemAuthState extends State<ItemAuth> {
  void _onLogin() async {
    var url = Uri.http("192.168.14.23:8000", "/login");
    var response = await http.post(url,
        body: json.encode({
          "email": _emailController.text,
          "password": _passwordController.text
        }));

    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeMainScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.body)));
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
                child: Image.asset("assets/images/logo_tchat.jpg",
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
