
import 'package:authentication_user/authService/authService.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void signUP() async {
    //gettting data
    var email = _emailController.text;
    var password = _passwordController.text;
    var confirmPassword = _confirmPasswordController.text;
    //loading
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password does not match")));
      return;
    }
    try {
      await authService.signUpWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error Occured $e")));
      }
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SignUp Page"),
        ),
        body:
            ListView(padding: const EdgeInsets.symmetric(horizontal: 10), children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
                label: Text("Email"),
                hintText: "Enter Email",
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
                label: Text("Password"),
                hintText: "Enter Password",
                hintStyle: TextStyle(color: Colors.grey)),
            obscureText: true,
          ),
        TextField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(
                label: Text("Confirm Password"),
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: Colors.grey)),
          obscureText: true,
        ),
          const SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: signUP, child: const Text("SignUp")),
        ]));
  }
}
