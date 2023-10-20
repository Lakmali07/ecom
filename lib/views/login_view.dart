import 'package:ecom/widgets/form_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Column(
            children: [
              const Text('Welcome'),
              FormTextField(
                  controller: _usernameController,
                  inputType: 'none',
                  preffixIcon: const Icon(Icons.email_outlined),
                  isRequired: true),
              FormTextField(
                  controller: _passwordController,
                  inputType: 'none',
                  preffixIcon: const Icon(Icons.lock_open_outlined),
                  isRequired: true),
            ],
          ),
        ),
      ),
    );
  }
}
