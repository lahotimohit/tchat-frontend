import 'package:flutter/material.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';

class ItemAuth extends StatelessWidget {
  ItemAuth({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/logo_tchat.jpg", width: 250, height:250)),
          Text("Sign In",
          style: TextStyle(color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold),),
          const SizedBox(height: 30,),
          TextFieldWidget(controller: _emailController, labelText: "Email Address", obscureText: false),
          const SizedBox(height: 20,),
          TextFieldWidget(controller: _passwordController, labelText: "Password", obscureText: true),
          const SizedBox(height: 20,),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.surface),
               child: const Text("Log In")),
            ),
          )
        ],),
      );
  }
}